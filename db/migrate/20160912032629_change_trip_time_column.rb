class ChangeTripTimeColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :departure_time
    remove_column :trips, :arrival_time

    add_column :trips, :departure_time, :datetime
    add_column :trips, :arrival_time, :datetime
  end
end
