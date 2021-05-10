class CreateConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.integer :device_id
      t.integer :network_id
      t.integer :conected_device_id
      t.timestamps
    end
  end
end
