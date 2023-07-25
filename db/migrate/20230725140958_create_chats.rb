class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :done_id, null: false
      t.integer :user_id, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
