class ItemsController < ApplicationController
  before_action :set_user
  before_action :set_item, only: [:show, :update, :edit, :destroy]

  def index
    @items = Item.all
  end

  def show
    @items = Item.all
    @request = Request.new

    # @owner = @item.user
    # @other_items_by_owner =  @owner.items - [@item]
  end

  def new
    @item = Item.new
    @category = Category.new
  end

  def create
    @item = Item.new(item_params)
    @category = Category.find(params[:category])
    @item.category = @category
    @item.user = current_user

    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  def edit; end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_user
    @user = current_user
  end

  def item_params
    params.require(:item).permit(:name, :description, :picture)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
