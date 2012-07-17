class Qr < ActiveRecord::Base
  attr_accessible :default_resource
  has_many :resources, dependent: :destroy
  belongs_to :user  
  validates :user_id, presence: true
  belongs_to :collection
end
