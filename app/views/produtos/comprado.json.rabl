object false
node (:success) { true }
node (:info) { 'Produto comprado!' }
child :data do
  child @produto do
    attributes :id, :descricao, :nome, :quantidade, :status, :compra_id, :created_at
  end
end