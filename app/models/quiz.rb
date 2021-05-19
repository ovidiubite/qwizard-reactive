class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  has_one_attached :image
end
