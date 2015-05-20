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

ActiveRecord::Schema.define(version: 20150520023704) do

  create_table "debtors", force: true do |t|
    t.integer  "user_id"
    t.integer  "debt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "debtors", ["debt_id"], name: "index_debtors_on_debt_id"
  add_index "debtors", ["user_id"], name: "index_debtors_on_user_id"

  create_table "debts", force: true do |t|
    t.float    "amount"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "debts", ["owner_id"], name: "index_debts_on_owner_id"

  create_table "invoices", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "invoices", ["owner_id"], name: "index_invoices_on_owner_id"

  create_table "items", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "needed"
  end

  create_table "line_items", force: true do |t|
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
    t.integer  "item_id"
  end

  add_index "line_items", ["invoice_id"], name: "index_line_items_on_invoice_id"
  add_index "line_items", ["item_id"], name: "index_line_items_on_item_id"

  create_table "payments", force: true do |t|
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.integer  "destination_id"
    t.integer  "creator_id"
    t.boolean  "accepted"
  end

  add_index "payments", ["creator_id"], name: "index_payments_on_creator_id"
  add_index "payments", ["destination_id"], name: "index_payments_on_destination_id"
  add_index "payments", ["source_id"], name: "index_payments_on_source_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               default: "changeme", null: false
    t.string   "first_name",             default: "John",     null: false
    t.string   "last_name",              default: "Doe",      null: false
    t.boolean  "admin",                  default: false
    t.float    "share",                  default: 1.0
    t.integer  "owner_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["owner_id"], name: "index_users_on_owner_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
