class Qr < ActiveRecord::Base
  attr_accessible :default_resource, :resources, :resources_attributes, :qr_name
  has_many :resources, dependent: :destroy
  accepts_nested_attributes_for :resources
  belongs_to :user  
  validates :user_id, presence: true
  belongs_to :collection


  def default_resource
  	#we return the URI for the first resource, so everything works as expected
  	return resources.first.uri
  end
end
