class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.text :description
      t.date :start_date
      t.date :end_date
      t.time :start_hour
      t.time :end_hour

      t.timestamps
    end
  end
end
