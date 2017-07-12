class AddUsersFields < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :firstname, :string
    add_column :users, :middlename, :string
    add_column :users, :lastname, :string

    add_index :users, :phone, unique: true
  end
end
