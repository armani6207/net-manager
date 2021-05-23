class ModifyDevices < ActiveRecord::Migration[6.1]
  def change
    remove_column :devices, :type
    add_column :devices, :device_type, :string
  end
end
