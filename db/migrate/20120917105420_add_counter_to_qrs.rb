class AddCounterToQrs < ActiveRecord::Migration
  def change
  	add_column :Qrs, :view_counter, :integer

  end
end
