class AddQrIdFromResources < ActiveRecord::Migration
  def change
  	  	  	 add_column :resources, :qr_id, :integer

  end
end
