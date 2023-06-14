class ChangeDatatypeEmphasisOfPosts2 < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :emphasis, :boolean, default: false
  end
end
