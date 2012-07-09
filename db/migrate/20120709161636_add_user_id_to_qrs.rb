class AddUserIdToQrs < ActiveRecord::Migration
  def change
    add_column :qrs, :user_id, :integer
  end
end
