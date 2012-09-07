class AddProfileToResource < ActiveRecord::Migration
  def change
    add_column :resources, :profile_id, :integer
  end
end
