class ReorderUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :last_name, :string, after: :first_name
  end
end
