class AddDefaultToGmap < ActiveRecord::Migration
  def change
  	change_column :localizations, :gmaps, :boolean, :default => false
  end
end
