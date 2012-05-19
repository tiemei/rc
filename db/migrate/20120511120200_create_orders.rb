class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :num, :null => false
      t.float :sum_price, :null => false
      t.string :name, :null => false
      t.string :tel, :null => false
      t.string :status
      t.references :products, :null => false
      t.references :users, :null => false

      t.timestamps
    end
    add_foreign_key(:orders,
                    :products,
                    :dependent => :delete_all,
                    :column => 'products_id',
                    :name => 'fk_orders_products')
    add_foreign_key(:orders,
                    :users,
                    :dependent => :delete_all,
                    :column => 'users_id',
                    :name => 'fk_orders_users')
  end
end
