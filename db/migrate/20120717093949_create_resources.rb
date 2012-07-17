class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.string :uri
      t.string :type
      t.string :image_location

      t.timestamps
    end
  end
end
