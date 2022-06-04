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
    render partial: "item_infos", locals: { item: @items }, notice: "Updated!"
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
end
