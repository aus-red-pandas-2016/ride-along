class AddDepartureAndArrivalTimesToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :departure_time, :time
    add_column :trips, :arrival_time, :time
  end
end
