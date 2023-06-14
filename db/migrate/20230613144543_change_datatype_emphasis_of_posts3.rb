class ChangeDatatypeEmphasisOfPosts3 < ActiveRecord::Migration[7.0]
  def change
    def up
      #change_column :テーブル名, :型を変更したいカラム名, :変更後のデータ型
      change_column :posts, :emphasis, :boolean, default: false
     end
   
     def down
      #change_column :テーブル名, :型を戻すカラム名, :変更前のデータ型
      change_column :posts, :emphasis, :boolean, default: false, null: false
     end
  end
end
