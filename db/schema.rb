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

ActiveRecord::Schema.define(version: 2018_12_12_150954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "sale_id"
    t.bigint "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_applications_on_purchase_id"
    t.index ["sale_id"], name: "index_applications_on_sale_id"
  end

  create_table "certifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "coffee_certifications", force: :cascade do |t|
    t.bigint "coffee_lot_id"
    t.bigint "certification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_id"], name: "index_coffee_certifications_on_certification_id"
    t.index ["coffee_lot_id"], name: "index_coffee_certifications_on_coffee_lot_id"
  end

  create_table "coffee_lots", force: :cascade do |t|
    t.bigint "purchase_id"
    t.string "provenance"
    t.integer "quantity"
    t.string "tree"
    t.string "iconumber"
    t.integer "screen_size"
    t.string "cup_profile"
    t.string "region"
    t.string "quality_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sale_id"
    t.index ["purchase_id"], name: "index_coffee_lots_on_purchase_id"
    t.index ["sale_id"], name: "index_coffee_lots_on_sale_id"
  end

  create_table "etiquettes", force: :cascade do |t|
    t.bigint "sample_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sample_id"], name: "index_etiquettes_on_sample_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "potential_clients", force: :cascade do |t|
    t.bigint "coffee_lot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.index ["coffee_lot_id"], name: "index_potential_clients_on_coffee_lot_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exporter_id"
    t.integer "trader_id"
    t.integer "owner_id"
  end

  create_table "receptions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "trader_id"
  end

  create_table "samples", force: :cascade do |t|
    t.string "stage"
    t.bigint "coffee_lot_id"
    t.integer "sweetness"
    t.integer "acidity"
    t.integer "clean"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "exporter_id"
    t.integer "trader_id"
    t.integer "status"
    t.text "flavour"
    t.index ["coffee_lot_id"], name: "index_samples_on_coffee_lot_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "purchases"
  add_foreign_key "applications", "sales"
  add_foreign_key "coffee_certifications", "certifications"
  add_foreign_key "coffee_certifications", "coffee_lots"
  add_foreign_key "coffee_lots", "purchases"
  add_foreign_key "coffee_lots", "sales"
  add_foreign_key "etiquettes", "samples"
  add_foreign_key "potential_clients", "coffee_lots"
  add_foreign_key "potential_clients", "users", column: "client_id"
  add_foreign_key "purchases", "users", column: "exporter_id"
  add_foreign_key "purchases", "users", column: "owner_id"
  add_foreign_key "purchases", "users", column: "trader_id"
  add_foreign_key "sales", "users", column: "client_id"
  add_foreign_key "sales", "users", column: "trader_id"
  add_foreign_key "samples", "coffee_lots"
  add_foreign_key "samples", "users", column: "exporter_id"
  add_foreign_key "samples", "users", column: "trader_id"
end
