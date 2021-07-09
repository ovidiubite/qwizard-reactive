# frozen_string_literal: true

class NotifyQuestionStartJob < ApplicationJob
  def perform(lobby_id:, question_index:)
    @lobby = Lobby.find(lobby_id)

    @lobby.update!(current_question_index: question_index)

    @lobby.players.each do |player|
      broadcast_question_start(question_index: question_index, player_id: player.id)
    end

    question = @lobby.quiz.questions.find_by(order: question_index)

    NotifyQuestionEndJob
      .set(wait: question.time_limit.seconds)
      .perform_later(lobby_id: lobby_id)
  end

  def broadcast_question_start(question_index:, player_id:)
    Turbo::StreamsChannel.broadcast_stream_to(
      @lobby, Lobby::QUESTION_START,
      content: ApplicationController.render(
        :turbo_stream,
        partial: 'lobbies/question',
        locals: { lobby: @lobby, question_index: question_index, player_id: player_id }
      )
    )
  end
end
