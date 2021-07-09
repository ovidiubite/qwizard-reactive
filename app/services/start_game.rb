class StartGame
  def initialize(lobby_id:)
    @lobby = Lobby.find(lobby_id)
  end

  def call
    @lobby.update!(status: :in_progress)
    update_game_state
    broadcast_lobby_start

    NotifyQuestionStartJob
      .set(wait: 3.seconds)
      .perform_later(lobby_id: @lobby.id, question_index: 1)
  end

  def update_game_state
    @lobby.players.update_all(game_state: :counter)
  end

  def broadcast_lobby_start
    Turbo::StreamsChannel.broadcast_stream_to(
      @lobby, Lobby::LOBBY_START,
      content: ApplicationController.render(
        :turbo_stream,
        partial: 'lobbies/start_game',
        locals: {}
      )
    )
  end
end
