class ItemsController < ApplicationController
    # before_action :set_user

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
    end

    def create
    end

    def update
    end

    def edit
    end

    def destroy
    end

    # def set_user
    #     @user = current_user
    # end

end
