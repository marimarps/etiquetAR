class AddCollectionIdToQrs < ActiveRecord::Migration
  def change
    add_column :qrs, :collection_id, :integer
  end
end
