class AddTypeToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :type, :string
  end
end
