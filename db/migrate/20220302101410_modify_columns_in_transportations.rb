class ModifyColumnsInTransportations < ActiveRecord::Migration[6.1]
  def change
    change_column :transportations, :departure_date, :datetime
    change_column :transportations, :arrival_date, :datetime
    remove_column :transportations, :departure_hour
    remove_column :transportations, :arrival_hour
  end
end
