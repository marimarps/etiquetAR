class ChangeQrCollectionIdType < ActiveRecord::Migration
  def change
  	change_column :qrs, :collection_id, :integer
  end
end
