class CreateAccomodationVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :accomodation_votes do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :accomodation, null: false, foreign_key: true
      t.integer :vote

      t.timestamps
    end
  end
end
