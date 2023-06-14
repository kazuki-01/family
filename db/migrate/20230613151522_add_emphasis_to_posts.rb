class AddEmphasisToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :emphasis, :boolean, default: false, null: false
  end
end
