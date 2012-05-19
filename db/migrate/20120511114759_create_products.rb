class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.float :price, :null => false
      t.string :simg
      t.string :bimg
      t.string :description
      t.string :to_url
      t.integer :comment_count, :null => false

      t.timestamps
    end
  end
end
