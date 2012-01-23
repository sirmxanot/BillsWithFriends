class CreateYouOweMes < ActiveRecord::Migration
  def change
    create_table :you_owe_mes do |t|
      t.integer :expense_id
      t.integer :amount
      t.integer :creditor_id
      t.integer :debtor_id

      t.timestamps
    end
  end
end
