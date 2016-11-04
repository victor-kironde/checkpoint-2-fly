class RefactorFlightsTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :flights, :departure, :origin
    rename_column :flights, :arrival, :destination
    add_column :flights, :distance, :float
    add_column :flights, :duration, :float
    add_column :flights, :price, :float
    add_column :flights, :airline_id, :integer
  end
end
