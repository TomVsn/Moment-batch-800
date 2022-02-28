class ChangeAmoutToAmount < ActiveRecord::Migration[6.1]
  def change
    rename_column :expenses, :amout, :amount
  end
end
