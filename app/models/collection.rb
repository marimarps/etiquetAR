class Collection < ActiveRecord::Base
  attr_accessible :name
  has_many :qrs, dependent: :destroy
  belongs_to :user 
  validates :user_id, presence: true
end
