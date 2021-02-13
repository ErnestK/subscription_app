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

ActiveRecord::Schema.define(version: 2021_02_12_155451) do

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_currencies_on_name", unique: true
  end

  create_table "rates", force: :cascade do |t|
    t.integer "base_currency_id", null: false
    t.integer "quote_currency_id", null: false
    t.decimal "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_currency_id", "quote_currency_id"], name: "index_rates_on_base_currency_id_and_quote_currency_id", unique: true
    t.index ["base_currency_id"], name: "index_rates_on_base_currency_id"
    t.index ["quote_currency_id"], name: "index_rates_on_quote_currency_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "price_usd_cents", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subscriptions_on_name", unique: true
  end

end
