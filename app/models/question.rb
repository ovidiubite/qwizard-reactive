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
end
