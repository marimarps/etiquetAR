class Qr < ActiveRecord::Base
  attr_accessible :default_resource
  belongs_to :user  
  validates :user_id, presence: true
end
