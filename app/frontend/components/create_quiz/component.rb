class CreateQuiz::Component < ApplicationViewComponent
  param :quiz
  param :question

  def build_sidemenu
    @quiz.questions.map do |q|
      {
        text: q.title,
        path: quiz_question_path(@quiz, q),
        icon: 'trashDark'
      }
    end << {
      text: 'New Question',
      path: new_quiz_question_path(@quiz),
    }
  end
end
