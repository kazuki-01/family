class RemoveDayOfWeekFromWeeklies < ActiveRecord::Migration[7.0]
  def change
    remove_column :weeklies, :day_of_week, :string
  end
end
