class ScoreInBetween::Preview < ApplicationViewComponentPreview
  def default
    render(ScoreInBetween::Component.new(Lobby.first, 1, 10, Player.first))
  end
end
