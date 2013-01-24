class MoveProfilesToCollections < ActiveRecord::Migration
  def up
  	add_column :profiles, :collection_id, :integer
  	add_index :profiles, :collection_id
  	remove_column :profiles, :user_id
  end

  def down
  	add_column :profiles, :user_id, :integer
  	remove_column :profiles, :collection_id
  end
end
