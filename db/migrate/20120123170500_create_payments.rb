class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :owner_id
      t.datetime :date_paid
      t.integer :total_amount
      t.string :memo

      t.timestamps
    end
  end
end
