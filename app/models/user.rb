class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body

  devise :ldap_authenticatable, :token_authenticatable

  attr_accessible :email, :password

  before_save :ensure_authentication_token
end
