class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:home, :landing]

  def home
    @users = User.all
    @items = params[:query].present? ? Item.search_n_d_a(params[:query]) : Item.all

    users_with_items = @items.map {|item| item.user }
        if !current_user.nil?
            users_with_items << current_user
        end
    @users = users_with_items.uniq
    # @users_with_items = []
    # @items.each do |item|
    #   unless @users_with_items.include?(item.user)
    #     @users_with_items << item.user
    #   end
    # end
    # @relation_users_with_items = User.where(id: @users_with_items.map(&:id))

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "items/info_window", formats: [:html], locals: { user: user }),
        image_url: user == current_user ? helpers.asset_url("home.png") : helpers.asset_url("coffee.png")
      }
    end
    respond_to do |format|
      format.html
      format.text { render partial: 'pages/list', locals: { items: @items }, formats: [:html] }
    end
  end

  def landing
  end
end
