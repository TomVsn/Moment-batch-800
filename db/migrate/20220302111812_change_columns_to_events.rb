class ChangeColumnsToEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :start_hour
    remove_column :events, :end_hour
    change_column :events, :start_date, :datetime
    change_column :events, :end_date, :datetime
  end
end
