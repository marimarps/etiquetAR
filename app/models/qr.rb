class Qr < ActiveRecord::Base
  attr_accessible :default_resource, :resources_attributes, :qr_name
  has_many :resources, dependent: :destroy
  accepts_nested_attributes_for :resources
  belongs_to :user  
  validates :user_id, presence: true
  belongs_to :collection

  after_commit :create_qr_url



private
  def create_qr_url
      self.qr_url = "http://etiquetar.com.es"
      self.save
  end
end
