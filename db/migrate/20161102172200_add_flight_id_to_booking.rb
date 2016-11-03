class AddFlightIdToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :flight_id, :integer
    change_column :bookings, :reference, :string
    rename_column :bookings, :cost, :price
    rename_column :bookings, :date, :departure


  end
end
