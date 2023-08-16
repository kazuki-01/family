class AddGroupIdToWeekly < ActiveRecord::Migration[7.0]
  def change
    add_column :weeklies, :group_id, :integer
  end
end
