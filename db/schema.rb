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

ActiveRecord::Schema.define(version: 20150727170141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paints", force: :cascade do |t|
    t.string   "name"
    t.string   "component1"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paints", ["brand_id"], name: "index_paints_on_brand_id", using: :btree

  create_table "paints_palettes", force: :cascade do |t|
    t.integer  "paint_id"
    t.integer  "palette_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paints_palettes", ["paint_id"], name: "index_paints_palettes_on_paint_id", using: :btree
  add_index "paints_palettes", ["palette_id"], name: "index_paints_palettes_on_palette_id", using: :btree

  create_table "palettes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "palettes", ["user_id"], name: "index_palettes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "paints", "brands"
  add_foreign_key "paints_palettes", "paints"
  add_foreign_key "paints_palettes", "palettes"
  add_foreign_key "palettes", "users"
end
