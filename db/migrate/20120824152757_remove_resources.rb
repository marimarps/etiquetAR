class RemoveResources < ActiveRecord::Migration
  def up
  	remove_column :qrs, :resources
  end

  def down
  end
end
