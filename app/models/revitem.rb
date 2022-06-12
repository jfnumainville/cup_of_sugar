class Revitem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :request

  after_update_commit :notify_recepient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recepient
    RevitemNotification.with(review: self, item: item).deliver_later(item.user)
  end

  def cleanup_notifications
    notifications_as_request.destroy_all
  end
end
