class RefactorFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :airline
  end
end
