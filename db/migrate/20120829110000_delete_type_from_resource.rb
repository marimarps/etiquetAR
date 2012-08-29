class DeleteTypeFromResource < ActiveRecord::Migration
  def up
  	remove_column :resources, :type
  end

  def down
  end
end
