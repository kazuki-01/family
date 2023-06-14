class RemoveEmphasisFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :emphasis, :boolean
  end
end
