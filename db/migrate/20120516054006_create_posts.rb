class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :content, null: false
      t.string :simg
      t.string :bimg
      t.references :user, null: false
      t.timestamps
      
    end
    add_foreign_key(:posts,
                    :users,
                    dependent: :delete_all,
                    column: 'user_id',
                    name: 'fk_posts_users')
  end

  def down
    drop_table :posts
  end
end
