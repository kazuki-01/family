class AddGroupIdToDones < ActiveRecord::Migration[7.0]
  def change
    add_column :dones, :group_id, :integer
  end
end
