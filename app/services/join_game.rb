# frozen_string_literal: true

class JoinGame
  def initialize(lobby, player_params)
    @lobby = lobby
    @player = @lobby.players.create(player_params)
  end

  def call
    Turbo::StreamsChannel.broadcast_stream_to(
        @lobby, :players,
        content: ApplicationController.render(
            :turbo_stream,
            partial: "lobbies/show",
            locals: {player: @player}
        )
    )

    @player.id
  end
end
