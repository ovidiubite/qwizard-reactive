class Lobby::Component < ApplicationViewComponent
  param :lobby

  def quiz
    @lobby.quiz
  end

  def quiz_master
    @lobby.quiz.user
  end
end
