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

ActiveRecord::Schema.define(version: 20160131161906) do

  create_table "abdominal_condition_visits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "abdominal_conditions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "abdominal_conditions_visits", id: false, force: :cascade do |t|
    t.integer "visit_id",               null: false
    t.integer "abdominal_condition_id", null: false
    t.string  "details"
  end

  create_table "condition_names", force: :cascade do |t|
    t.string   "name"
    t.integer  "condition_type_id"
    t.boolean  "unique"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "condition_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "condition_values", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "condition_name_id"
  end

  add_index "condition_values", ["condition_name_id"], name: "index_condition_values_on_condition_name_id"

  create_table "condition_visits", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "condition_type_id"
    t.integer  "condition_name_id"
    t.integer  "condition_value_id"
    t.string   "details"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "constitution_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultation", id: false, force: :cascade do |t|
    t.integer "visit_id",      null: false
    t.integer "specialist_id", null: false
    t.string  "result"
  end

  create_table "consultations", id: false, force: :cascade do |t|
    t.integer "visit_id",      null: false
    t.integer "specialist_id", null: false
    t.string  "result"
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.string   "password_conformation"
    t.string   "specialization"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
  end

  add_index "doctors", ["email"], name: "index_doctors_on_email", unique: true
  add_index "doctors", ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true

  create_table "effleurage_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "general_state_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "liver_condition_visits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "liver_conditions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "liver_conditions_visits", id: false, force: :cascade do |t|
    t.integer "visit_id",           null: false
    t.integer "liver_condition_id", null: false
    t.string  "details"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postural_pose_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subcutanious_fat_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.string   "from"
    t.datetime "created_at",                 null: false
    t.string   "complaints"
    t.string   "anamnesis"
    t.string   "allerg"
    t.string   "general_state"
    t.string   "diagnosis"
    t.datetime "updated_at",                 null: false
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.integer  "constitution_option_id"
    t.integer  "general_state_option_id"
    t.integer  "postural_pose_option_id"
    t.integer  "subcutanious_fat_option_id"
    t.integer  "effleurage_option_id"
  end

  add_index "visits", ["constitution_option_id"], name: "index_visits_on_constitution_option_id"
  add_index "visits", ["doctor_id"], name: "index_visits_on_doctor_id"
  add_index "visits", ["effleurage_option_id"], name: "index_visits_on_effleurage_option_id"
  add_index "visits", ["general_state_option_id"], name: "index_visits_on_general_state_option_id"
  add_index "visits", ["patient_id"], name: "index_visits_on_patient_id"
  add_index "visits", ["postural_pose_option_id"], name: "index_visits_on_postural_pose_option_id"
  add_index "visits", ["subcutanious_fat_option_id"], name: "index_visits_on_subcutanious_fat_option_id"

end
