class QuestionItem::Component < ApplicationViewComponent
  param :quiz
  param :question

  option :active, default: proc { false }
end
