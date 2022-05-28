class AddDefaultPendingToRequests < ActiveRecord::Migration[6.1]
  def change
    change_column :requests, :status, :integer, default: 0
  end
end
