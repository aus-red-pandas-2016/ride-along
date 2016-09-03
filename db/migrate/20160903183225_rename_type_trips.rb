class RenameTypeTrips < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :type, :trips_type
  end
end
