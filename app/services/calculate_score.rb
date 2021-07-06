# frozen_string_literal: true

class CalculateScore
  def initialize(lobby:)
    @lobby = lobby
  end

  def call
    scores = @lobby.players.map do |player|
      grouped_player_answers = player.player_answers.group_by { |player_answer| player_answer.answer.question }

      score = {
        id: player.id,
        name: player.name,
        hat: player.hat,
        points: 0
      }

      grouped_player_answers.each do |question, player_answers|
        next if player_answers.any? { |player_answer| player_answer.answer.is_correct == false }

        score[:points] += question.points
      end

      score
    end

    scores.sort_by! { |s| -s[:points] }
  end
end
