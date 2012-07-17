class AddCollectionIdToQrs < ActiveRecord::Migration
  def change
    add_column :qrs, :collection_id, :string
  end
end
