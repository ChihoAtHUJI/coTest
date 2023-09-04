class User < ApplicationRecord
  #Logic for the password
  has_secure_password
  #Validates the presence and uniqueness of the attributes
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  # validates :country, allow_blank: true
end
