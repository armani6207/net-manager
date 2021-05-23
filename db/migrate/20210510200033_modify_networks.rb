class ModifyNetworks < ActiveRecord::Migration[6.1]
  def change
    add_column :networks, :user_id, :integer
  end
end
