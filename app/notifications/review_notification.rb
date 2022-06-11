# To deliver this notification:
#
# ReviewNotification.with(post: @post).deliver_later(current_user)
# ReviewNotification.with(post: @post).deliver(current_user)

class ReviewNotification < Noticed::Base
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
    @item = Item.find(params[:review][:item_id])
    @review = Review.find(params[:review][:id])
    @user = User.find(@review.user_id)
    "#{@user.name} just left review on your #{@item.name.truncate(15)}"
  end

  def url
    item_path(Item.find(params[:review][:item_id]))
  end
end
