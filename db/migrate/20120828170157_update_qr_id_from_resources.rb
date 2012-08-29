class UpdateQrIdFromResources < ActiveRecord::Migration
  def up
  	  	remove_column :resources, :qr_id

  end

  def down

  end
end
