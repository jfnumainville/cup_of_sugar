class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :reviews

  validates :start_date, :end_date, presence: true

  enum status: {
    pending: 0,
    approved: 1,
    declined: 2
  }
end
