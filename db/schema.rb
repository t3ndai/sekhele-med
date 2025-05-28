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

ActiveRecord::Schema[8.0].define(version: 2025_05_28_200236) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "action", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "lab_branch_users", force: :cascade do |t|
    t.integer "lab_branch_id", null: false
    t.string "first_name"
    t.string "middle_names"
    t.string "last_names"
    t.string "role_type"
    t.string "phone"
    t.string "email"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_branch_id"], name: "index_lab_branch_users_on_lab_branch_id"
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

  create_table "patient_procedure_results", force: :cascade do |t|
    t.text "notes"
    t.integer "lab_branch_user_id", null: false
    t.integer "patient_procedure_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_branch_user_id"], name: "index_patient_procedure_results_on_lab_branch_user_id"
    t.index ["patient_procedure_id"], name: "index_patient_procedure_results_on_patient_procedure_id"
  end

  create_table "patient_procedures", force: :cascade do |t|
    t.integer "procedure_id", null: false
    t.integer "lab_branch_user_id", null: false
    t.date "procedure_on"
    t.time "procedure_at"
    t.integer "patient_visit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_branch_user_id"], name: "index_patient_procedures_on_lab_branch_user_id"
    t.index ["patient_visit_id"], name: "index_patient_procedures_on_patient_visit_id"
    t.index ["procedure_id"], name: "index_patient_procedures_on_procedure_id"
  end

  create_table "patient_visit_billings", force: :cascade do |t|
    t.decimal "amount_due"
    t.decimal "amount_paid"
    t.string "status"
    t.string "payment_method"
    t.integer "patient_visit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_visit_id"], name: "index_patient_visit_billings_on_patient_visit_id"
  end

  create_table "patient_visits", force: :cascade do |t|
    t.integer "patient_id", null: false
    t.integer "referrer_id"
    t.string "visit_type"
    t.json "allergies"
    t.json "medicines"
    t.json "vitals"
    t.time "visit_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_visits_on_patient_id"
    t.index ["referrer_id"], name: "index_patient_visits_on_referrer_id"
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
    t.integer "lab_branch_user_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["lab_branch_user_id"], name: "index_users_on_lab_branch_user_id"
    t.index ["lab_user_id"], name: "index_users_on_lab_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "users"
  add_foreign_key "lab_branch_users", "lab_branches"
  add_foreign_key "lab_branches", "labs"
  add_foreign_key "lab_users", "labs"
  add_foreign_key "patient_procedure_results", "lab_branch_users"
  add_foreign_key "patient_procedure_results", "patient_procedures"
  add_foreign_key "patient_procedures", "lab_branch_users"
  add_foreign_key "patient_procedures", "patient_visits"
  add_foreign_key "patient_procedures", "procedures"
  add_foreign_key "patient_visit_billings", "patient_visits"
  add_foreign_key "patient_visits", "patients"
  add_foreign_key "patient_visits", "referrers"
  add_foreign_key "patients", "lab_branches"
  add_foreign_key "procedures", "lab_branches"
  add_foreign_key "referrers", "lab_branches"
  add_foreign_key "sessions", "users"
  add_foreign_key "sign_in_tokens", "users"
  add_foreign_key "users", "lab_branch_users"
  add_foreign_key "users", "lab_users"
end
