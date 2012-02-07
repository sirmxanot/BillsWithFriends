class DropIPaidYou < ActiveRecord::Migration
  def up
  	drop_table :i_paid_yous
  end

  def down
  end
end
