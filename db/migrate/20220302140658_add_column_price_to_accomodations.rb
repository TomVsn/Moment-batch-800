class AddColumnPriceToAccomodations < ActiveRecord::Migration[6.1]
  def change
    add_column :accomodations, :price, :float
  end
end
