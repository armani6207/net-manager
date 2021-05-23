class ModifyConnections < ActiveRecord::Migration[6.1]
  def change
    remove_column :connections, :conected_device_id
    add_column :connections, :connected_device_id, :integer
  end
end
