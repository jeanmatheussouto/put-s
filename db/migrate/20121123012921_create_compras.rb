class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.string :nome
      t.text :descricao
      t.string :slug

      t.timestamps
    end

    add_index :compras, :slug, unique: true
  end
end
