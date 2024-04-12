# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_11_231203) do
  create_table "addresses", force: :cascade do |t|
    t.integer "street_number"
    t.string "street_name"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "agents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "npn"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "phone"
    t.index ["user_id"], name: "index_agents_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.date "dob"
    t.string "email"
    t.integer "agent_id"
    t.integer "insurance_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_customers_on_agent_id"
    t.index ["insurance_company_id"], name: "index_customers_on_insurance_company_id"
  end

  create_table "insurance_companies", force: :cascade do |t|
    t.string "name"
    t.integer "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_insurance_companies_on_agent_id"
  end

  create_table "policies", force: :cascade do |t|
    t.string "policy_type"
    t.date "exp_date"
    t.string "term_length"
    t.integer "customer_id", null: false
    t.integer "agent_id", null: false
    t.integer "insurance_company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "premium_amount"
    t.string "policy_file"
    t.index ["agent_id"], name: "index_policies_on_agent_id"
    t.index ["customer_id"], name: "index_policies_on_customer_id"
    t.index ["insurance_company_id"], name: "index_policies_on_insurance_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "agents", "users"
  add_foreign_key "customers", "agents"
  add_foreign_key "customers", "insurance_companies"
  add_foreign_key "insurance_companies", "agents"
  add_foreign_key "policies", "agents"
  add_foreign_key "policies", "customers"
  add_foreign_key "policies", "insurance_companies"
end
