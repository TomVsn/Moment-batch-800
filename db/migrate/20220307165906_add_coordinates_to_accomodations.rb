class AddCoordinatesToAccomodations < ActiveRecord::Migration[6.1]
  def change
    add_column :accomodations, :latitude, :float
    add_column :accomodations, :longitude, :float
  end
end
