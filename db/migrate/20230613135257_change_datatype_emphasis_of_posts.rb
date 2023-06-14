class ChangeDatatypeEmphasisOfPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :emphasis, :boolean, default: false, null: false
  end
end
