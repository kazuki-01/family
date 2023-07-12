class CreateWeeklies < ActiveRecord::Migration[7.0]
  def change
    create_table :weeklies do |t|
      t.string :task, null: false
      t.integer :labor, null: false
      t.string :classification, null: false
      t.integer :day_of_week, null: false

      t.timestamps
    end
  end
end
