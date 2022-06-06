# To deliver this notification:
#
# RequestNotification.with(post: @post).deliver_later(current_user)
# RequestNotification.with(post: @post).deliver(current_user)

class RequestNotification < Noticed::Base
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
    @item = Item.find(params[:request][:item_id])
    @request = Request.find(params[:request][:id])
    @user = User.find(@request.user_id)
    "#{@user.name} requested your #{@item.name.truncate(15)}"
  end
  #
  def url
    # item_path(Item.find(params[:request][:item_id]))
    # Notification.mark_as_read!
    requests_path(active_tab: "lending")
  end
end
