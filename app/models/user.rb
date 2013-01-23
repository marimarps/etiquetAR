# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
 attr_accessible :name, :email, :password, :password_confirmation, :collections_attributes
  has_many :qrs, dependent: :destroy
  has_many :collections, dependent: :destroy
  has_many :profiles, dependent: :destroy
  has_secure_password
  accepts_nested_attributes_for :collections

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  after_save :create_example_qr

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def create_example_qr
      @qr = self.qrs.create!(qr_name: 'example_qr')
      @qr.collections.create!(name: 'All Tags', user_id: self.id)
      @qr.resources.create!(:name => 'example_resource', :uri => 'http://www.etiquetar.com.es')
    end
end
