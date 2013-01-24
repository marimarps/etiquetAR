class Collection < ActiveRecord::Base	
  attr_accessible :name, :id, :user_id, :qrs, :qrs_attributes  
  has_many :qrs
  accepts_nested_attributes_for :qrs

  belongs_to :user 
  has_many :profiles
  
end
