class CreateComprasUsersJoinTable < ActiveRecord::Migration
  def up
  	create_table :compras_users, :id => false do |t|
  		t.integer :compra_id
  		t.integer :user_id
  	end
  end

  def down
  	drop_table :compras_users
  end
end
