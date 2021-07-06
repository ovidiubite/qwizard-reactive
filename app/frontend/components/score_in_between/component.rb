class ScoreInBetween::Component < ApplicationViewComponent
  param :lobby
  param :question_index
  param :total_questions
  param :current_player

  def score
    CalculateScore.new(lobby: lobby).call
  end
end
