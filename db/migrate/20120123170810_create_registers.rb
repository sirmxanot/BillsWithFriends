class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.integer :creditor_id
      t.integer :debtor_id
      t.integer :credit_extended

      t.timestamps
    end
  end
end
