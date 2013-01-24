class Collection < ActiveRecord::Base	
  attr_accessible :name, :id, :user_id
  
  has_and_belongs_to_many :qrs, :join_table => :collections_qrs

  belongs_to :user 
  has_many :profiles
  
end
