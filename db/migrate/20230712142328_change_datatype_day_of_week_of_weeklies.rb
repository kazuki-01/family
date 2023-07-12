class ChangeDatatypeDayOfWeekOfWeeklies < ActiveRecord::Migration[7.0]
  def change
    change_column :weeklies, :day_of_week, :string
  end
end
