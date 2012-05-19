class AddIconToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :sicon, default: 'sicon.jpg', null: false
      t.string :bicon, default: 'bicon.jpg', null: false
    end
  end
end
