object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:produtos_count) { @produtos.size }
  child @produtos do
    attributes :id, :descricao, :nome, :quantidade, :status, :created_at
  end
end