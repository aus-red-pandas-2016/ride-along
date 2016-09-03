class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :type
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.belongs_to :user

      t.timestamps
    end
  end
end
