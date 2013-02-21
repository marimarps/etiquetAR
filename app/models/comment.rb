class Comment < ActiveRecord::Base
  attr_accessible :comment, :name, :resource_id
  belongs_to :resource
  validates_presence_of :comment, :name
end
