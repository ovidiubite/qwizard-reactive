class Question < ApplicationRecord
  validates :title, presence: true
  validates :time_limit, presence: true
  validates :points, presence: true
  validates :answer_type, presence: true
  validates :order, presence: true, uniqueness: { scope: :quiz_id }

  enum answer_type: [:single, :multiple]

  has_one_attached :image

  belongs_to :quiz
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  def self.empty_question(quiz)
    question = Question.new

    question.quiz_id = quiz.id
    question.points  = 100
    question.order   = (quiz.questions.pluck(:order).max.presence || 0) + 1
    question.answers = 4.times.map { Answer.new }

    question
  end
end
