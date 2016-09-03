class AddTimestampsToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :created_at, :datetime
    add_column :trips, :updated_at, :datetime
  end
end
