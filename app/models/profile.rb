class Profile < ActiveRecord::Base
  attr_accessible :name, :user_id
  has_many :resources, dependent: :destroy
  belongs_to :user

  validates_presence_of :name
end
