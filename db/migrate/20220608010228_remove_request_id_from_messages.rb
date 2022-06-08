class RemoveRequestIdFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_column :messages, :request_id, :string
  end
end
