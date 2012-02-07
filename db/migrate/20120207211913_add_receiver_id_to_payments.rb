class AddReceiverIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :receiver_id, :integer
  end
end
