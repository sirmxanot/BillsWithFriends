class DropPeopleTable < ActiveRecord::Migration
  def up
  	drop_table :people
  end

  def down
  end
end
