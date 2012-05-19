class FixForeignKeyName < ActiveRecord::Migration

  def change
    # drop foreign_keys
    remove_foreign_key :addrs, name: 'fk_addrs_users'   
    remove_foreign_key :comments, name: 'fk_comments_users'   
    remove_foreign_key :comments, name: 'fk_comments_product'   
    remove_foreign_key :orders, name: 'fk_orders_products'   
    remove_foreign_key :orders, name: 'fk_orders_users'   
    remove_foreign_key :relationships, name: 'fk_relationships_users'   
    remove_column :addrs, :users_id
    remove_column :comments, :users_id
    remove_column :comments, :products_id
    remove_column :orders, :products_id
    remove_column :orders, :users_id
    remove_column :relationships, :users_id

    change_table :addrs do |t|
      t.integer :user_id
    end
    change_table :comments do |t|
      t.integer :product_id
      t.integer :user_id
    end
    change_table :orders do |t|
      t.integer :product_id
      t.integer :user_id
    end
    change_table :relationships do |t|
      t.integer :user_id
    end

    # add foreign_keys  
    add_foreign_key(:addrs,
                    :users,
                    :dependent => :delete_all,
                    :column => 'user_id',
                    :name => 'fk_addrs_users')
    add_foreign_key(:comments,
                    :users,
                    :dependent => :delete_all,
                    :column => 'user_id',
                    :name => 'fk_comments_users')
    add_foreign_key(:comments,
                    :products,
                    :dependent => :delete_all,
                    :column => 'product_id',
                    :name => 'fk_comments_products')
    add_foreign_key(:orders,
                    :products,
                    :dependent => :delete_all,
                    :column => 'product_id',
                    :name => 'fk_orders_products')
    add_foreign_key(:orders,
                    :users,
                    :dependent => :delete_all,
                    :column => 'user_id',
                    :name => 'fk_orders_users')
    add_foreign_key(:relationships, 
                    :users, 
                    :dependent => :delete_all,
                    :column => 'user_id',
                    :name => 'fk_relationships_users')

  end


end
