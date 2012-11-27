class Compra < ActiveRecord::Base
	attr_accessible :descricao, :nome, :user_id

  #cada compra tem muitos usuarios
  has_and_belongs_to_many :users

  has_many :produtos

  validates :nome, :presence => true, :length => { :minimum => 3 }

end
