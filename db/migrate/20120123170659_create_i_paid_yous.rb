class CreateIPaidYous < ActiveRecord::Migration
  def change
    create_table :i_paid_yous do |t|
      t.integer :payment_id
      t.integer :amount
      t.integer :payer_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
