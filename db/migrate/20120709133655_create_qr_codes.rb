class CreateQrCodes < ActiveRecord::Migration
  def change
    create_table :qr_codes do |t|
      t.string :default_resource

      t.timestamps
    end
  end
end
