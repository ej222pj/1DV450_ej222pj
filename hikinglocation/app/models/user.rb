require 'digest/sha1'
class User < ActiveRecord::Base
  
  attr_accessor :password

  before_save :hash_password
  after_save :clear_password
  

  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true, length: { minimum: 6 }
  #Only on Create so other actions like update password attribute can be nil
  #validates_length_of :password, :in => 6..20, :on => :create

  def self.authenticate(username_or_email="", login_password="")

    if  EMAIL_REGEX.match(username_or_email)    
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    hashed_password == Digest::SHA1.hexdigest(login_password)
    #hash_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def hash_password
    unless password.blank?
      self.hashed_password= Digest::SHA1.hexdigest(password)

     # self.salt = BCrypt::Engine.generate_salt
     # self.hash_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

end