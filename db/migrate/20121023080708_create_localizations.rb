class CreateLocalizations < ActiveRecord::Migration
  def change
    create_table :localizations do |t|
      t.text :address
      t.boolean :gmaps 
      t.float :latitude
      t.float :longitude
      t.integer :qr_id
      t.timestamps
    end
    add_index :localizations, :id, unique: true

  end
end
