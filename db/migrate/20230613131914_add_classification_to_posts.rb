class AddClassificationToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :classification, :string, null: false
  end
end
