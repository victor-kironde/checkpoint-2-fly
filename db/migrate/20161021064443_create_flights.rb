class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :departure
      t.string :arrival
      t.string :date
      t.string :flight_number
      t.string :airline

      t.timestamps
    end
  end
end
