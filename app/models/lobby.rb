class Lobby < ApplicationRecord
  validates :code, presence: true
  validates :status, presence: true
  validates :current_question_index, presence: true

  belongs_to :quiz
  has_many :players, dependent: :destroy

  enum status: [:pending, :in_progress, :finished]

  scope :finished, -> { where(status: :finished) }
end
