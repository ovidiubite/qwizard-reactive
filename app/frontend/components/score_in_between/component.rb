class ScoreInBetween::Component < ApplicationViewComponent
  option :lobby
  option :question_index
  option :total_questions
  option :current_player_id

  def score
    CalculateScore.new(lobby: lobby).call
  end
end
