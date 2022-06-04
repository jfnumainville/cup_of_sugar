class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item

  has_many :reviews
  has_many :messages, dependent: :destroy

  validates :start_date, :end_date, presence: true
  validate :dates_cannot_be_in_the_past, :end_date_is_after_start_date, on: :create

  after_create_commit :notify_recepient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'


  enum status: {
    pending: 0,
    approved: 1,
    declined: 2
  }

  private

  def dates_cannot_be_in_the_past
    return if end_date.blank? || start_date.blank?

    if start_date < Date.today
      errors.add(:start_date, "can't be in the past!")

    elsif end_date < Date.today
      errors.add(:end_date, "can't be in the past!")
    end
  end

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end

  def notify_recepient
    RequestNotification.with(request: self, item: item).deliver_later(item.user)
  end

  def cleanup_notifications
    notifications_as_request.destroy_all
  end
end
