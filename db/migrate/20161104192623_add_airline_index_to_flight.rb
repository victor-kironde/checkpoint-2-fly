class AddAirlineIndexToFlight < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :date
    remove_column :flights, :flight_number
    add_index :flights, :airline_id
  end
end
