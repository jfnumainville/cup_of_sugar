class CategoriesController < ApplicationController

  def index
    @categories = []
      if params[:query].present?
        search_words = params[:query].downcase.split

        search_words.each do |word|
          suggested_category = Category.where("'#{word}' = ANY (keywords)")

          ## If there is a match category will be added.
          if !(suggested_category == [])

            if !(@categories.include? suggested_category)
            @categories << suggested_category[0]
            end
          end
        end


        ## If the query does not return any match, then we return all categories.
        if @categories == []
          @categories = Category.all

        ## Removing any possible duplicates by using "uniq"

         end


      else
        @categories = Category.all
      end


   render json: @categories
  end
end
