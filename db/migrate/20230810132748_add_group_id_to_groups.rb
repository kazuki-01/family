class AddGroupIdToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :group_id, :integer
  end
end
