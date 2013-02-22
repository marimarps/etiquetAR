class SetVisibleToTrue < ActiveRecord::Migration
  def up
     change_column :comments, :visible, :boolean, :default => true
  end


  def down
     change_column :comments, :visible, :boolean

  end
end
