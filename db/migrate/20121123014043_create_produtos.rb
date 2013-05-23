class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.decimal :quantidade
      t.boolean :status
      t.integer :compra_id
      t.string :slug

      t.timestamps
    end

    add_index :produtos, :slug, unique: true
  end
end
