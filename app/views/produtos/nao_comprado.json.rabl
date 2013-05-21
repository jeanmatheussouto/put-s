object false
node (:success) { true }
node (:info) { 'Produto não Comprado!' }
child :data do
  child @produto do
    attributes :id, :descricao, :nome, :quantidade, :status, :compra_id, :created_at
  end
end