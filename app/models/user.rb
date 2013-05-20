class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
   :token_authenticatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :nome

  has_and_belongs_to_many :compras

  validates :nome, :presence => true, :length => { :minimum => 3 }
  validates :email, :presence => true

  before_save :ensure_authentication_token

  def resource_name
  	:user
  end

  def resource
  	@resource ||= User.new
  end

  def devise_mapping
  	@devise_mapping ||= Devise.mappings[:user]
  end

  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
