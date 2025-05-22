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

ActiveRecord::Schema[8.0].define(version: 2025_05_22_184803) do
  create_table "events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "action", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "lab_branches", force: :cascade do |t|
    t.string "name"
    t.integer "lab_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_lab_branches_on_lab_id"
  end

  create_table "lab_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.integer "lab_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_lab_users_on_lab_id"
  end

  create_table "labs", force: :cascade do |t|
    t.string "company_name"
    t.string "trading_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_names"
    t.string "last_name"
    t.date "dob"
    t.text "address"
    t.string "email"
    t.string "phone"
    t.integer "lab_branch_id", null: false
    t.json "emergency_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_branch_id"], name: "index_patients_on_lab_branch_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.decimal "cost"
    t.integer "lab_branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_branch_id"], name: "index_procedures_on_lab_branch_id"
  end

  create_table "referrers", force: :cascade do |t|
    t.integer "lab_branch_id", null: false
    t.string "share_code"
    t.string "name"
    t.text "address"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_branch_id"], name: "index_referrers_on_lab_branch_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "sign_in_tokens", force: :cascade do |t|
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sign_in_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role", default: "user", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lab_user_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["lab_user_id"], name: "index_users_on_lab_user_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "lab_branches", "labs"
  add_foreign_key "lab_users", "labs"
  add_foreign_key "patients", "lab_branches"
  add_foreign_key "procedures", "lab_branches"
  add_foreign_key "referrers", "lab_branches"
  add_foreign_key "sessions", "users"
  add_foreign_key "sign_in_tokens", "users"
  add_foreign_key "users", "lab_users"
end
