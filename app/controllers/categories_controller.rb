class CategoriesController < ApplicationController

  def index
    @categories = []
      if params[:query].present?
        search_words = params[:query].downcase.split

        ##looping through each words in the query parameter
        search_words.each do |word|
          suggested_category = Category.where("'#{word}' = ANY (keywords)")

          ## If there is a match category for a word, it will be added to the @categories array.
          if !(suggested_category == [])
            if !(@categories.include? suggested_category)
            @categories << suggested_category[0]
            end
          end
        end
      end
   render json: @categories
  end
end
