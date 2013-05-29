class AddColunmValorToProdutos < ActiveRecord::Migration
  def change
    add_column :produtos, :valor, :decimal
  end
end
