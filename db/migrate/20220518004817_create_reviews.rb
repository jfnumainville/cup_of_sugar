class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.references :request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
