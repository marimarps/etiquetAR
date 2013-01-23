class CreateCollectionsQrs < ActiveRecord::Migration
  def change
    create_table :collections_qrs, :id => false do |t|
      t.integer :qr_id, :null => false
      t.integer :collection_id, :null => false
    end
    add_index "collections_qrs", ["collection_id", "qr_id"]
  end
end
