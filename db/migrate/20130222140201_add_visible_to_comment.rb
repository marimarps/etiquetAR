class AddVisibleToComment < ActiveRecord::Migration
  def change
    add_column :comments, :visible, :boolean, 
  end
end
