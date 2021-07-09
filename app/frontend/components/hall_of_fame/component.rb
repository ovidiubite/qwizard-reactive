class HallOfFame::Component < ApplicationViewComponent
  option :lobby
  option :current_player_id

  def quiz_title
    lobby.quiz.title
  end

  def score
    CalculateScore.new(lobby: lobby).call
  end
end
