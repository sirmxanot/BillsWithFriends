class OwnerIdtoUserId < ActiveRecord::Migration
  def up
  	change_table :expenses do |t|
  		t.rename :owner_id, :user_id
  	end
  end

  def down
  end
end
