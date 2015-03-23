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

ActiveRecord::Schema.define(version: 20150321183635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: true do |t|
    t.string   "buildingname"
    t.string   "buildingid"
    t.string   "street_address"
    t.string   "locality"
    t.string   "region"
    t.string   "postcode"
    t.integer  "customer_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "buildings", ["buildingname"], name: "index_buildings_on_buildingname", unique: true, using: :btree
  add_index "buildings", ["customer_id"], name: "index_buildings_on_customer_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "company"
    t.string   "street_address"
    t.string   "region"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locality"
  end

  add_index "customers", ["company"], name: "index_customers_on_company", unique: true, using: :btree

  create_table "materials", force: true do |t|
    t.integer  "space_id",                                             null: false
    t.string   "materialtype"
    t.string   "color",             limit: 10
    t.string   "hanum",             limit: 15
    t.integer  "acm_category"
    t.integer  "numsamp"
    t.integer  "sqft"
    t.integer  "batchnum"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "material_category"
    t.boolean  "removed"
    t.decimal  "amtdamage",                    precision: 3, scale: 2
    t.integer  "typedamage"
    t.string   "file_reference"
    t.integer  "building_id",                                          null: false
    t.integer  "customer_id",                                          null: false
  end

  create_table "reports", force: true do |t|
    t.string   "reportname"
    t.text     "description"
    t.string   "filename"
    t.integer  "customer_id", null: false
    t.date     "report_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pdf"
  end

  add_index "reports", ["customer_id"], name: "index_reports_on_customer_id", using: :btree
  add_index "reports", ["filename"], name: "index_reports_on_filename", unique: true, using: :btree
  add_index "reports", ["reportname"], name: "index_reports_on_reportname", unique: true, using: :btree

  create_table "spaces", force: true do |t|
    t.string   "spacename"
    t.string   "spaceid"
    t.string   "roomnum"
    t.integer  "floor"
    t.integer  "roomsqft"
    t.integer  "building_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id", null: false
  end

  add_index "spaces", ["building_id"], name: "index_spaces_on_building_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",               default: false, null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "customer_id"
    t.boolean  "is_admin"
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["customer_id"], name: "index_users_on_customer_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
