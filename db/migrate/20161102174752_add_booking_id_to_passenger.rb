class AddBookingIdToPassenger < ActiveRecord::Migration[5.0]
  def change
    add_column :passengers, :booking_id, :integer
    add_column :passengers, :phone, :string
  end
end
