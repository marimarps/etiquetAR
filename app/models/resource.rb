class Resource < ActiveRecord::Base
  attr_accessible :image_location, :name, :type, :uri, :qr_id, :profile_id
  belongs_to :qr  
  belongs_to :profile
  #validates :qr_id, presence: true
  def as_json 
    return {:profile => (self.profile == nil ? false : self.profile.name), :uri => self.uri}
  end
end
