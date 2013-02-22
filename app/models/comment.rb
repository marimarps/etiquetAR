class Comment < ActiveRecord::Base
  attr_accessible :comment, :name, :resource_id, :visible
  belongs_to :resource
  validates_presence_of :comment, :name

  def is_visible?
    return true if self[:visible] == nil
    return self[:visible]
end
end
