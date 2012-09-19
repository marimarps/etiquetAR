class AddCounterToResources < ActiveRecord::Migration
  def change

  	add_column :resources, :view_counter, :integer

  end
end
