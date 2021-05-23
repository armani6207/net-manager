class ModifyCOnnection < ActiveRecord::Migration[6.1]
  def change
    remove_column :connections, :connected_device_id
    add_column :connections, :device_nick_name, :string
  end
end
