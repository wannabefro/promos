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

ActiveRecord::Schema.define(version: 20140821233846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: true do |t|
    t.string   "attachment"
    t.integer  "attachable_id"
    t.integer  "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["attachable_id", "attachable_type"], name: "index_attachments_on_attachable_id_and_attachable_type", using: :btree

  create_table "cards", force: true do |t|
    t.string   "header_color",  default: "#2C3E50", null: false
    t.string   "content_color", default: "#E74C3C", null: false
    t.string   "header_text",                       null: false
    t.string   "content_text",                      null: false
    t.integer  "promotion_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["promotion_id"], name: "index_cards_on_promotion_id", using: :btree

  create_table "codes", force: true do |t|
    t.integer  "promotion_id",                null: false
    t.string   "token",                       null: false
    t.integer  "status",       default: 0,    null: false
    t.integer  "quantity",     default: 1,    null: false
    t.boolean  "unique",       default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "codes", ["promotion_id"], name: "index_codes_on_promotion_id", using: :btree
  add_index "codes", ["token"], name: "index_codes_on_token", unique: true, using: :btree
  add_index "codes", ["unique"], name: "index_codes_on_unique", using: :btree

  create_table "promotions", force: true do |t|
    t.string   "name",                   null: false
    t.integer  "status",     default: 0, null: false
    t.integer  "user_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.text     "message"
  end

  add_index "promotions", ["slug"], name: "index_promotions_on_slug", unique: true, using: :btree
  add_index "promotions", ["user_id"], name: "index_promotions_on_user_id", using: :btree

  create_table "redemptions", force: true do |t|
    t.string   "ip_address", null: false
    t.integer  "code_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "location"
  end

  add_index "redemptions", ["code_id", "ip_address"], name: "index_redemptions_on_code_id_and_ip_address", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
