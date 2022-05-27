class ChangeRatingToBeIntegerInReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :rating, :integer
  end
end
