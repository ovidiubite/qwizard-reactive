# frozen_string_literal: true

class NotifyQuestionEndJob < ApplicationJob
  def perform(lobby_id:)
    @lobby = Lobby.find(lobby_id)
    players = @lobby.players

    next_question = @lobby.quiz.questions.find_by(order: @lobby.current_question_index + 1)

    if next_question.nil?
      players.each do |player|
        NotifyLobbyEndJob.perform_now(lobby_id: lobby_id, player_id: player.id)
      end

      return
    else
      @lobby.players.update_all(game_state: :leaderboard)

      players.each do |player|
        broadcast_question_end(player_id: player.id)
      end
    end

    NotifyQuestionStartJob.set(wait: Lobby::SHOW_SCORE_DELAY_SECONDS).perform_later(
      lobby_id: lobby_id, question_index: @lobby.current_question_index + 1
    )
  end

  def broadcast_question_end(player_id:)
    Turbo::StreamsChannel.broadcast_stream_to(
      @lobby, player_id, Lobby::QUESTION_END,
      content: ApplicationController.render(
        :turbo_stream,
        partial: 'lobbies/partial_score',
        locals: { lobby: @lobby, player_id: player_id, question_index: @lobby.current_question_index, total_questions: @lobby.quiz.questions.count}
      )
    )
  end
end
