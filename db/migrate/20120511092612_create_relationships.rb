class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :to_id, :null => false
      t.integer :status,:null => false
      t.references :users, :null => false

      t.timestamps
    end
    ## add a foreign key
    #execute <<-SQL
      #ALTER TABLE relationships
        #ADD CONSTRAINT fk_relationships_users
        #FOREIGN KEY (users_id)
        #REFERENCES users(id)
    #SQL
    add_foreign_key(:relationships, 
                    :users, 
                    :dependent => :delete_all,
                    :column => 'users_id',
                    :name => 'fk_relationships_users')
  end
end
