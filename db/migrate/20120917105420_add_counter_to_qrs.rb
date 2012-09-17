class AddCounterToQrs < ActiveRecord::Migration
  def change
  	add_column :qrs, :view_counter, :integer

  end
end
