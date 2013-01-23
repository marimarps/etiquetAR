class Localization < ActiveRecord::Base 
    extend Geocoder::Model::ActiveRecord

  acts_as_gmappable :process_geocoding => true
  after_save :update_gmap

  attr_accessible :address, :gmaps, :latitude, :longitude, :qr_id
  belongs_to :qr 

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    address
  end

  def gmaps4rails_infowindow 
    "<p>  #{address} </p>" 
  end

  def update_gmap
    if self.gmaps==true
      self.update_attributes({:gmaps => false})
    end
  end

end
