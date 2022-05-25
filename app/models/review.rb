class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :rating, :description, presence: true
end
