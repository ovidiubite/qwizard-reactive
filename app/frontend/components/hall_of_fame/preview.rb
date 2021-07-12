class HallOfFame::Preview < ApplicationViewComponentPreview
  def default
    render(HallOfFame::Component.new(lobby: Lobby.first, current_player_id: Player.first.id))
  end
end
