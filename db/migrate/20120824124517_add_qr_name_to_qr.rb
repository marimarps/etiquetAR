class AddQrNameToQr < ActiveRecord::Migration
  def change
    add_column :qrs, :qr_name, :string
  end
end
