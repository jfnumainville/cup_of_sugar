class CreateReviewsItems < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews_items do |t|
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
