# To deliver this notification:
#
# RevitemNotification.with(post: @post).deliver_later(current_user)
# RevitemNotification.with(post: @post).deliver(current_user)

class RevitemNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    if !params[:request].nil?
      @item = Item.find(params[:request][:item_id])
      "Leave a review on #{@item.name.truncate(15)}"
    end
  end

  def url
    item_path(Item.find(params[:review][:item_id]))
  end
end
