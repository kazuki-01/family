class AddDateToWeeklies < ActiveRecord::Migration[7.0]
  def change
    add_column :weeklies, :date, :date
  end
end
