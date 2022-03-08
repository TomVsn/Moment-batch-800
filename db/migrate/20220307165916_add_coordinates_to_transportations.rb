class AddCoordinatesToTransportations < ActiveRecord::Migration[6.1]
  def change
    add_column :transportations, :latitude, :float
    add_column :transportations, :longitude, :float
  end
end
