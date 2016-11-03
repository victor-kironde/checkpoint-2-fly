class RefactorFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :airline
    remove_column :flights, :flight_number
    remove_column :flights, :date
  end
end
