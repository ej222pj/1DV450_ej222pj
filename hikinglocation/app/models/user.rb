class User < ActiveRecord::Base
  has_secure_password
  has_many :apikeys

  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: {:message => "is required!"}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :username, presence: {:message => "is required!"}, length:  { maximum: 15 }, uniqueness:  { case_sensitive: false }
end