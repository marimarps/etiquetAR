class SetUriToText < ActiveRecord::Migration
  def up
    change_column :resources, :uri, :text
  end

  def down
    change_column :resources, :uri, :string
  end
end
