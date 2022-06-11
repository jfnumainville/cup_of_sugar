# To deliver this notification:
#
# RequestEndNotification.with(post: @post).deliver_later(current_user)
RequestEndNotification.with(post: @post).deliver(current_user)

class RequestEndNotification < Noticed::Base
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
    # notification = RequestEndNotification.with(request: @request)
    # @notification = notification.deliver(@request.end_date)
    # "#{@notification} received"
    @item = Item.find(params[:request][:item_id])
    @request = Request.find(params[:request][:id])
    @user = User.find(@request.end_date)
    "Your #{@item.name} experience ends on #{@request.end_date} "
  end

  def url
    root_path
  end
end
