class ChangeQrCollectionIdType < ActiveRecord::Migration
  def up
  	remove_column :qrs, :collection_id
  	add_column :qrs, :collection_id, :integer
  	add_index :qrs, :collection_id
  end

  def down
  	add_column :qrs, :collection_id, :string
  	remove_column :qrs, :collection_id
 end
end
