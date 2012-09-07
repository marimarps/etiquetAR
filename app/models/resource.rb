class Resource < ActiveRecord::Base
  attr_accessible :image_location, :name, :type, :uri, :qr_id
  belongs_to :qr  
  belongs_to :profile
  #validates :qr_id, presence: true
end
