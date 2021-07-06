class HallOfFame::Preview < ApplicationViewComponentPreview
  def default
    render(HallOfFame::Component.new(Lobby.first, Player.first))
  end
end
