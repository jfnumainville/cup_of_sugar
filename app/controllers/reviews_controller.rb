class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def show
        @reviews = Review.all
    end

    def new
      @review = Review.new
    end

    def create
        @item = Item.find(params[:item_id])
        @review = current_user.reviews.new(review_params)
        @review.item = @item

        respond_to do |format|
            # if !@review.save
            #     flash[:notice] = @review.errors.full_messages.to_sentence
            # else
            #     redirect_to item_path(params[:item_id], anchor: "review-#{@review.id}")
            # end

            if @review.save
                format.html { redirect_to item_path(@item, anchor: "review-#{@review.id}") }
                format.json # normal Rails flow will look for a file called 'create.json'
            else
                format.html { render 'items/show' }
                format.json # normal Rails flow will look for a file called 'create.json'
            end
            if !current_user
            revitem = ReviewNotification.with(review: @review)
            revitem.deliver_later(User.find(@review.user_id))
            end
        end
    end

    def update; end

    def edit; end

    def destroy; end

    private

    def review_params
        params
            .require(:review)
            .permit(:description, :rating)
            .merge(item_id: params[:item_id])
    end
end
