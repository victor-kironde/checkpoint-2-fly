class AddReferenceAndDateToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :reference, :integer
    add_column :bookings, :date, :datetime
    add_column :bookings, :email, :string
  end
end
