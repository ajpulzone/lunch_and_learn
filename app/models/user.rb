class User < ApplicationRecord
  before_create :create_api_key

  validates_presence_of :name
  validates_presence_of :email
  validates :email, uniqueness: true
  validates :user_api_key, uniqueness: true

  has_many :favorites

  private
    def create_api_key
      self.user_api_key = SecureRandom.hex
    end
  end