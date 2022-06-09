class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
    end

    def show
        @reviews = Review.all
    end

    def new; end

    def create
        @item = Item.find(params[:item_id])
        @review = current_user.reviews.new(review_params)
        @review.item = @item

        if !@review.save
            flash[:notice] = @review.errors.full_messages.to_sentence
        else
            redirect_to item_path(params[:item_id], anchor: "review-#{@review.id}")
        end
    end

    def update; end

    def edit; end

    def destroy; end

    private

    def review_params
        params
            .require(:review)
            .permit(:description)
            .merge(item_id: params[:item_id])
    end
end
