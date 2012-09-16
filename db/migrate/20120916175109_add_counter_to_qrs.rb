class AddCounterToQrs < ActiveRecord::Migration
  def change
  	    add_column :qrs, :access_counter, :integer
  end
end
