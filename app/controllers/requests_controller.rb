class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy]
  before_action :find_user
  before_action :find_item, only: [:new, :create]

  def index
    @my_requests = Request.where(user_id: current_user).where.not(status: 2)
    my_item_ids = Item.where(user_id: current_user).pluck(:id)
    @my_requests_array = []

    my_item_ids.each do |id|
      matching_requests = Request.where(item_id: id).where.not(status: 2)
      matching_requests.each do |result|
        @my_requests_array << result
      end
    end
  end

  def show; end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    @request.item = @item
    if @request.save
      redirect_to requests_path
    else
      render 'items/show'
    end
  end

  def update
    @request.update(request_params)
    redirect_to resquests_path
  end

  def edit; end

  def destroy
    @request.destroy
    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:status, :start_date, :end_date)
  end

  def find_user
    @user = current_user
  end

  def find_request
    @request = Request.find(params[:id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
