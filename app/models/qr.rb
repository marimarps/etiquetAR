class Qr < ActiveRecord::Base

  attr_accessible :qr_name, :default_resource, :collection, :collections_attributes, :resources_attributes ,:localizations_attributes
  
  validates :user_id, presence: true

  has_many :resources, dependent: :destroy
  has_many :localizations, dependent: :destroy
  belongs_to :collection

  belongs_to :user  

  accepts_nested_attributes_for :resources
  accepts_nested_attributes_for :localizations
  accepts_nested_attributes_for :collection

  after_save :assign_default_collection



  def assign_default_collection
  end


  def default_resource
  	#we return the URI for the first resource, so everything works as expected
  	return resources.first.uri
  end
  def as_json(options)
    return {:tag => self.qr_name, :resources => self.resources.as_json}
  end

  def download_qr

  end
end
