class AddGroupIdToThanks < ActiveRecord::Migration[7.0]
  def change
    add_column :thanks, :group_id, :integer
  end
end
