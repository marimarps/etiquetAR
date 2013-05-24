class FixLongText < ActiveRecord::Migration
  def change
    change_column :resources, :uri, :text, :limit => nil
  end
end
