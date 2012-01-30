class PaymentsOwnerIdtoUserId < ActiveRecord::Migration
  def up
  	change_table :payments do |t|
  		t.rename :owner_id, :user_id
  	end
  end

  def down
  end
end
