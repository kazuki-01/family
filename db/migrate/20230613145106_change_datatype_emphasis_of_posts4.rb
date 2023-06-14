class ChangeDatatypeEmphasisOfPosts4 < ActiveRecord::Migration[7.0]
  def change
    def up
      change_column :posts, :emphasis, :boolean, default: false
     end
   
     def down
      change_column :posts, :emphasis, :boolean, default: false, null: false
     end
  end
end
