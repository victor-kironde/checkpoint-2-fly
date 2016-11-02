class AddCodeToAirports < ActiveRecord::Migration[5.0]
  def change
    add_column :airports, :code, :string
    add_column :airports, :city, :string
    add_column :airports, :country, :string
    add_column :airports, :latitude, :float
    add_column :airports, :longitude, :float, after: :latitude
    remove_column :airports, :location
  end
end
