class ItemsController < ApplicationController
  before_action :set_user
  before_action :set_item, only: [:show, :update, :edit, :destroy]

  def home; end

  def index
    @items = Item.all
  end

  def show
    @request = Request.new
    @owner = @item.user
    @other_items_by_owner = @owner.items - [@item]
    mark_notifications_as_read
  end

  def new
    @item = Item.new
    # @category = Category.new
  end

  def create
    @item = Item.new(item_params)
    # @category = Category.find(params[:category])
    # @item.category = @category
    @item.user = current_user

    if @item.save
      redirect_to requests_path(active_tab: "items")
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    render partial: "items/item_infos", locals: { my_item: @item }
  end

  def edit; end

  def destroy
    @item.destroy
    redirect_to requests_path
  end

  private

  def set_user
    @user = current_user
  end

  def item_params
    params.require(:item).permit(:name, :description, :category, :picture)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def mark_notifications_as_read
    if current_user
      notifications_to_mark_as_read = @item.notifications_as_item.where(recipient: current_user)
      notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
    end
  end

end
