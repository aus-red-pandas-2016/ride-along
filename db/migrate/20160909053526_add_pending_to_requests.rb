class AddPendingToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :pending, :boolean
  end
end
