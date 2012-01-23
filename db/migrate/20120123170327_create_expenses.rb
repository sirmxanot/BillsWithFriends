class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :expense_name
      t.integer :owner_id
      t.date :date_incurred
      t.integer :total_amount
      t.string :memo

      t.timestamps
    end
  end
end
