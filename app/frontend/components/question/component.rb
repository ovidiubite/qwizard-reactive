class Question::Component < ApplicationViewComponent
  option :question_index
  option :lobby
  option :current_player_id

  def answers
    question.answers
  end

  def questions
    lobby.quiz.questions
  end

  def question
    questions.find_by(order: question_index)
  end

  def total_questions
    questions.count
  end

  def timer
    question.time_limit
  end

  def answers_count
    players = lobby.players.to_a.select do |p|
      p.player_answers.any? { |pa| pa.answer.question.order == lobby.current_question_index }
    end

    players.count
  end

end
