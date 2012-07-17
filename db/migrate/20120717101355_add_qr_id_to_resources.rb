class AddQrIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :qr_id, :string
  end
end
