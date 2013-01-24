class Profile < ActiveRecord::Base
  attr_accessible :name, :collection_id
  has_many :resources
  belongs_to :collection
  belongs_to :profile

  validates_presence_of :name
end
