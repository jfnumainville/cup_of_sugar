class Item < ApplicationRecord
  belongs_to :user

  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :description, :category, presence: true

  def average_rating
    if self.reviews.size.zero?
      return "Be the first to leave a review!"
    else
      return self.reviews.inject(0.0) { |sum, review| sum + review.rating }/self.reviews.size
    end
  end

  # pg search
  include PgSearch::Model
  pg_search_scope :search_n_d_a, against: { name: 'A', description: 'B' }, associated_against: {
    user: [:address]
  }, using: {
    tsearch: { prefix: true }
  }
end
