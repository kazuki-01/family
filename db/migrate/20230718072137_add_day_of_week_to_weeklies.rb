class AddDayOfWeekToWeeklies < ActiveRecord::Migration[7.0]
  def change
    add_column :weeklies, :monday, :boolean, default: false, null: false
    add_column :weeklies, :tuesday, :boolean, default: false, null: false
    add_column :weeklies, :wednesday, :boolean, default: false, null: false
    add_column :weeklies, :thursday, :boolean, default: false, null: false
    add_column :weeklies, :friday, :boolean, default: false, null: false
    add_column :weeklies, :saturday, :boolean, default: false, null: false
    add_column :weeklies, :sunday, :boolean, default: false, null: false
  end
end
