class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :nome
 
  has_and_belongs_to_many :compras

  validates :nome, :presence => true, :length => { :minimum => 3 }
  validates :email, :presence => true

  def resource_name
  	:user
  end
  
  def resource
  	@resource ||= User.new
  end
  
  def devise_mapping
  	@devise_mapping ||= Devise.mappings[:user]
  end
end
