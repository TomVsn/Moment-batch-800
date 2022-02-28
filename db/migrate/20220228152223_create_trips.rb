class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.string :title
      t.text :description
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
