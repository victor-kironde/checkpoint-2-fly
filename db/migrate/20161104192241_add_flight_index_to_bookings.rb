class AddFlightIndexToBookings < ActiveRecord::Migration[5.0]
  def change
    add_index :bookings, :flight_id
  end
end
