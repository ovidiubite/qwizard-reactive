class Quiz < ApplicationRecord
  # validates :title, presence: true

  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :lobbies, dependent: :destroy
end
