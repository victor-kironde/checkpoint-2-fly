class AddLastNameToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string, after: :first_name
  end
end
