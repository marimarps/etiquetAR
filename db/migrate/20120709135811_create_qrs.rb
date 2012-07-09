class CreateQrs < ActiveRecord::Migration
  def change
    create_table :qrs do |t|
      t.string :default_resource

      t.timestamps
    end
  end
end
