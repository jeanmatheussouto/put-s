class Produto < ActiveRecord::Base
  attr_accessible :descricao, :nome, :quantidade, :status, :compra_id

  #produto tem uma compra
  belongs_to :compra

  validates :nome, :presence => true
end
