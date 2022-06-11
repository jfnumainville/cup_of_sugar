require "open-uri"

class Item < ApplicationRecord
  before_save :default_picture
  belongs_to :user

  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :revitems
  validates :name, :description, :category, presence: true

  has_one_attached :picture
  has_noticed_notifications model_name: 'Notification'
  has_one :notification, through: :user, dependent: :destroy

  def average_rating
    if self.reviews.size.zero?
      return "Be the first to leave a review!"
    else
      @avg = self.reviews.inject(0.0) { |sum, review| sum + review.rating }/self.reviews.size
      return @avg.round(1)
    end
  end

  # pg search
  include PgSearch::Model
  pg_search_scope :search_n_d_a,
                  against: { name: 'A', category: 'B', description: 'C' },
                  using: { tsearch: { prefix: true } }

  def default_picture
      file = URI.open('https://res.cloudinary.com/degm2tmrv/image/upload/v1654612192/development/cup%20of%20sugar/coffee_p39sp1.png')
      self.picture.attach(io: file, filename: 'coffee.png', content_type: 'image/jpg') if self.picture.key.nil?
  end
end
