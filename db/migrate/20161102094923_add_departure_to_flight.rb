class AddDepartureToFlight < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :departure, :datetime
  end
end
