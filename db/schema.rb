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

ActiveRecord::Schema.define(version: 20170507045703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.decimal  "desired_sell_price", precision: 8, scale: 2
    t.decimal  "desired_buy_price",  precision: 8, scale: 2
    t.integer  "quantity"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "multiverse_id"
    t.string   "card_name"
  end

  create_table "cards", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.string   "image_url"
    t.integer  "multiverse_id"
    t.string   "set_name"
    t.decimal  "current_price", precision: 7, scale: 2
    t.string   "set"
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "card_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "price",      precision: 7, scale: 2
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "phone_number"
  end

end
