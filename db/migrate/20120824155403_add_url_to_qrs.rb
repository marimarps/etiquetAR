class AddUrlToQrs < ActiveRecord::Migration
  def change
  	    add_column :qrs, :qr_url, :string
  end
end
