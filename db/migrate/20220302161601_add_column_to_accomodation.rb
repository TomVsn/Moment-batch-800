class AddColumnToAccomodation < ActiveRecord::Migration[6.1]
  def change
    add_column :accomodations, :img, :string
  end
end
