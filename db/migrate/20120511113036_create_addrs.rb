class CreateAddrs < ActiveRecord::Migration
  def change
    create_table :addrs do |t|
      t.string :addr, :null => false
      t.references :users, :null => false

      t.timestamps
    end
    add_foreign_key(:addrs,
                    :users,
                    :dependent => :delete_all,
                    :column => 'users_id',
                    :name => 'fk_addrs_users')
  end
end
