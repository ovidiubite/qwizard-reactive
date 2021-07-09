# frozen_string_literal: true

class NotifyLobbyEndJob < ApplicationJob
  def perform(lobby_id:, player_id:)
    @lobby = Lobby.find(lobby_id)
    @lobby.update!(status: :finished)

    broadcast_lobby_end(player_id: player_id)
  end

  def broadcast_lobby_end(player_id:)
    Turbo::StreamsChannel.broadcast_stream_to(
      @lobby, player_id, Lobby::LOBBY_END,
      content: ApplicationController.render(
        :turbo_stream,
        partial: 'lobbies/final_score',
        locals: { lobby: @lobby, player_id: player_id }
      )
    )
  end
end
