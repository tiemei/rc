class AddLoveToProducts < ActiveRecord::Migration
  def change
    add_column :products, :love, :integer, :default => 0
  end
end
