class Item < ApplicationRecord
  belongs_to :user

  has_many :requests, dependent: :destroy

  validates :name, :description, :category, presence: true
end
