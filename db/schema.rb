# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120516060638) do

  create_table "addrs", :force => true do |t|
    t.string   "addr",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "addrs", ["user_id"], :name => "fk_addrs_users"

  create_table "comments", :force => true do |t|
    t.string   "body",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "product_id"
    t.integer  "user_id"
  end

  add_index "comments", ["product_id"], :name => "fk_comments_products"
  add_index "comments", ["user_id"], :name => "fk_comments_users"

  create_table "orders", :force => true do |t|
    t.integer  "num",        :null => false
    t.float    "sum_price",  :null => false
    t.string   "name",       :null => false
    t.string   "tel",        :null => false
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "product_id"
    t.integer  "user_id"
  end

  add_index "orders", ["product_id"], :name => "fk_orders_products"
  add_index "orders", ["user_id"], :name => "fk_orders_users"

  create_table "posts", :force => true do |t|
    t.string   "content",    :null => false
    t.string   "simg"
    t.string   "bimg"
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["user_id"], :name => "fk_posts_users"

  create_table "products", :force => true do |t|
    t.string   "name",                         :null => false
    t.float    "price",                        :null => false
    t.string   "simg"
    t.string   "bimg"
    t.string   "description"
    t.string   "to_url"
    t.integer  "comment_count", :default => 0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "love",          :default => 0
  end

  create_table "relationships", :force => true do |t|
    t.integer  "to_id",      :null => false
    t.integer  "status",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "relationships", ["user_id"], :name => "fk_relationships_users"

  create_table "users", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "email",                               :null => false
    t.string   "pwd",                                 :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "sicon",      :default => "sicon.jpg", :null => false
    t.string   "bicon",      :default => "bicon.jpg", :null => false
  end

  add_foreign_key "addrs", "users", :name => "fk_addrs_users"

  add_foreign_key "comments", "products", :name => "fk_comments_products"
  add_foreign_key "comments", "users", :name => "fk_comments_users"

  add_foreign_key "orders", "products", :name => "fk_orders_products"
  add_foreign_key "orders", "users", :name => "fk_orders_users"

  add_foreign_key "posts", "users", :name => "fk_posts_users"

  add_foreign_key "relationships", "users", :name => "fk_relationships_users"

end
