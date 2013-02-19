class AddContentTypeToResource < ActiveRecord::Migration
  def change
    add_column :resources, :content_type, :string
  end
end
