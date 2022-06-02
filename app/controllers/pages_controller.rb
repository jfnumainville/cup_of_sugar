class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @all_items = Item.all
    @users = User.all
    params[:query].present? ? @items = Item.search_n_d_a(params[:query]) : @items = @all_items
    @users_with_items = []
    @items.each do |item|
        unless @users_with_items.include?(item.user)
            @users_with_items << item.user
        end
    end
    @relation_users_with_items = User.where(id: @users_with_items.map(&:id))
    @markers = @relation_users_with_items.geocoded.map do |user|
        {
            lat: user.latitude,
            lng: user.longitude,
            info_window: render_to_string(partial: "items/info_window", locals: { user: user })
            # image_url: @item.images.first.present? ? @item.images.first.url : helpers.asset_url("unicorn.jpg")
          }
      end
  end

  def landing
  end
end
