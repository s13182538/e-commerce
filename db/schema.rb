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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150308101903) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["name"], name: "index_brands_on_name"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lft"
    t.integer  "rgt"
  end

  add_index "categories", ["lft"], name: "index_categories_on_lft"
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"
  add_index "categories", ["rgt"], name: "index_categories_on_rgt"

  create_table "payment_items", force: true do |t|
    t.integer  "payment_id"
    t.integer  "product_id"
    t.float    "price"
    t.integer  "qty"
    t.float    "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_items", ["payment_id"], name: "index_payment_items_on_payment_id"
  add_index "payment_items", ["product_id"], name: "index_payment_items_on_product_id"

  create_table "payment_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_statuses", ["name"], name: "index_payment_statuses_on_name"

  create_table "payments", force: true do |t|
    t.integer  "user_id"
    t.float    "amount"
    t.float    "shipping_cost"
    t.integer  "payment_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["payment_status_id"], name: "index_payments_on_payment_status_id"
  add_index "payments", ["user_id"], name: "index_payments_on_user_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.text     "description"
    t.text     "description_markup"
    t.integer  "product_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "qty",                default: 99
  end

  add_index "products", ["name"], name: "index_products_on_name"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "addr_one"
    t.string   "addr_two"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
  end

  add_index "users", ["postcode"], name: "index_users_on_postcode"

end
