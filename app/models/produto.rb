class Produto < ActiveRecord::Base
  attr_accessible :descricao, :nome, :quantidade, :status, :compra_id

  #produto tem uma compra
  belongs_to :compra

  validates :nome, :presence => true

  # método para alterar o status do produto
  def nao_comprado!
  	update_column(:status, false)
  end

  #define o status para comprado
  def comprado!
  	update_column(:status, true)
  end
end
