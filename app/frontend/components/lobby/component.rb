class Lobby::Component < ApplicationViewComponent
  option :lobby
  option :current_player

  def quiz
    @lobby.quiz
  end

  def quiz_master
    @lobby.quiz.user
  end
end
