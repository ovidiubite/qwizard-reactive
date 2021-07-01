class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  has_one_attached :image

  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :lobbies, dependent: :destroy
end
