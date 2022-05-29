class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @items = Item.all
    @users = User.all

    @markers = @users.geocoded.map do |user|
        {
            lat: user.latitude,
            lng: user.longitude,
            info_window: render_to_string(partial: "items/info_window", locals: { user: user })
            # image_url: @item.images.first.present? ? @item.images.first.url : helpers.asset_url("unicorn.jpg")
          }
      end
    params[:query].present? ? @items = Item.search_n_d_a(params[:query]) : @items = Item.all
  end
end
