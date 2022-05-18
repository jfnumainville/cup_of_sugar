class Review < ApplicationRecord
  belongs_to :request

  validates :rating, :description, presence: true
end
