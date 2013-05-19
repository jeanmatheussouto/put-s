object false
node (:success) { true }
node (:info) { 'ok' }
child :data do
  node (:compras_count) { @compras.size }
  child @compras do
    attributes :id, :nome, :created_at
  end
end