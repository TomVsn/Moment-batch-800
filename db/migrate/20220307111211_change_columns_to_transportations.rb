class ChangeColumnsToTransportations < ActiveRecord::Migration[6.1]
  def change
    add_column :transportations, :departure_hour_hour, :integer
    add_column :transportations, :departure_hour_minute, :integer
    add_column :transportations, :arrival_hour_hour, :integer
    add_column :transportations, :arrival_hour_minute, :integer
  end
end
