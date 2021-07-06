class HallOfFame::Component < ApplicationViewComponent
  param :lobby
  param :current_player

  def quiz_title
    lobby.quiz.title
  end

  def score
    CalculateScore.new(lobby: lobby).call
  end
end
