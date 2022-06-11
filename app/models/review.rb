class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

#   validates :rating, :description, presence: true
#   validates :description, presence: true
  after_create_commit :notify_recepient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recepient
    ReviewNotification.with(review: self, item: item).deliver_later(item.user)
  end

  def cleanup_notifications
    notifications_as_request.destroy_all
  end
end
