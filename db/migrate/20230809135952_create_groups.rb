class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :group_name, default: 'ファミリーネーム'
      t.boolean :paid, default: false, null: false

      t.timestamps
    end
  end
end
