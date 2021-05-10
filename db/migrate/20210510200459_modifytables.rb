class Modifytables < ActiveRecord::Migration[6.1]
  def change
    add_column :networks, :name, :string
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :devices, :name, :string
    add_column :devices, :type, :string
  end
end
