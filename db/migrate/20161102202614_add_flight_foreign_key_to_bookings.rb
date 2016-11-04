class AddFlightForeignKeyToBookings < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :bookings, :flights
    add_foreign_key :flights, :airlines
  end
end
