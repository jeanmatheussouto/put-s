class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
