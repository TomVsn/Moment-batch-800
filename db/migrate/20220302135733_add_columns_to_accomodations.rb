class AddColumnsToAccomodations < ActiveRecord::Migration[6.1]
  def change
    add_column :accomodations, :title, :string
    add_column :accomodations, :description, :text
  end
end
