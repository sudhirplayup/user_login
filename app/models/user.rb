class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation,:about_me, :first_name, :last_name, :deparment, :image ,:gender,:terms
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :deparment
  validates_presence_of :about_me
  validates_presence_of :image
  validates_presence_of :gender
  validates_presence_of :terms
  
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

