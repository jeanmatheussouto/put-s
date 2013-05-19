object false
node (:success) { true }
node (:info) { 'Lista de compra criada!' }
child :data do
  child @compra do
    attributes :id, :nome, :descricao, :created_at
  end
end