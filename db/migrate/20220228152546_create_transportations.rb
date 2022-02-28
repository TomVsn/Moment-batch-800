class CreateTransportations < ActiveRecord::Migration[6.1]
  def change
    create_table :transportations do |t|
      t.references :participant, null: false, foreign_key: true
      t.float :price
      t.string :origin
      t.string :destination
      t.string :type
      t.date :departure_date
      t.time :departure_hour
      t.date :arrival_date
      t.time :arrival_hour

      t.timestamps
    end
  end
end
