class SetDefaultCommentCountOfProducts < ActiveRecord::Migration
  def up
    change_table :products do |t|
      execute <<-SQL
        ALTER TABLE products
        ALTER comment_count SET DEFAULT 0
      SQL
    end
  end

  def down
    change_table :products do |t|
      execute <<-SQL
        ALTER TABLE products
        ALTER comment_count DROP DEFAULT
      SQL
    end
  end
end
