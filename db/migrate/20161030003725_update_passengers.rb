class UpdatePassengers < ActiveRecord::Migration[5.0]
  def change
    rename_column :passengers, :first_name, :name
    remove_column :passengers, :last_name
  end
end
