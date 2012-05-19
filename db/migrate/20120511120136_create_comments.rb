class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, :null => false
      t.references :users, :null => false
      t.references :products, :null => false
      t.timestamps
    end
    add_foreign_key(:comments,
                    :users,
                    :dependent => :delete_all,
                    :column => 'users_id',
                    :name => 'fk_comments_users')
    add_foreign_key(:comments,
                    :products,
                    :dependent => :delete_all,
                    :column => 'products_id',
                    :name => 'fk_comments_product')
  end
end
