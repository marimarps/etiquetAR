class FixCollectionUserId < ActiveRecord::Migration
  def up
  	remove_column :collections, :user_id
  	add_column :collections, :user_id, :integer
  	add_index :collections, :user_id
  end

  def down
  	add_column :collections, :user_id, :string
  	remove_column :collections, :user_id
 end
end
