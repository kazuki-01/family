class CreateDones < ActiveRecord::Migration[7.0]
  def change
    create_table :dones do |t|
      t.string :task, null: false
      t.integer :user_id, null: false
      t.integer :labor, null: false
      t.string :classification, null: false

      t.timestamps
    end
  end
end
