class Compra < ActiveRecord::Base
	attr_accessible :descricao, :nome, :user_id, :created_at

	extend FriendlyId
	friendly_id :nome, use: :slugged

  #cada compra tem muitos usuarios
  has_and_belongs_to_many :users

  has_many :produtos

  validates :nome, :presence => true, :length => { :minimum => 3 }

  def verifica_usuario_compra(user)
  	user = Compra.users.find(user.id)
  	if user?
  		verifica = true
  	else
  		verifica = false
  	end
  	verifica
  end

  def get_produtos_comprados(compra, status)
    comprados = compra.produtos.where(:status => status).size
  end

  def get_valor_total_compra
    total = 0.0
    self.produtos.each do |produto|
      if produto.valor
        if produto.quantidade?
          total = total + (produto.valor * produto.quantidade)
        else
          total += produto.valor
        end
      end
    end
    total
  end
end
