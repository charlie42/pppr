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

ActiveRecord::Schema.define(version: 20160507100538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abdominal_condition_visits", force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "abdominal_conditions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "abdominal_conditions_visits", id: false, force: :cascade do |t|
    t.integer "visit_id",               :null=>false
    t.integer "abdominal_condition_id", :null=>false
    t.string  "details"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_admins_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_admins_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        :default=>0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
  end

  create_table "anamnesis_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "anamnesis_names", force: :cascade do |t|
    t.string  "name"
    t.integer "anamnesis_type_id", :index=>{:name=>"index_anamnesis_names_on_condition_type_id"}, :foreign_key=>{:references=>"anamnesis_types", :name=>"anamnesis_names_anamnesis_type_id_fkey", :on_update=>:no_action, :on_delete=>:no_action}
    t.boolean "unique"
  end

  create_table "anamnesis_values", force: :cascade do |t|
    t.string  "name"
    t.integer "anamnesis_name_id", :index=>{:name=>"index_anamnesis_values_on_condition_name_id"}, :foreign_key=>{:references=>"anamnesis_names", :name=>"anamnesis_values_anamnesis_name_id_fkey", :on_update=>:no_action, :on_delete=>:no_action}
  end

  create_table "constitution_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "specialists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "created_at",                 :null=>false
    t.string   "complaints"
    t.text     "anamnesis"
    t.string   "allerg"
    t.string   "general_state"
    t.string   "diagnosis"
    t.datetime "updated_at",                 :null=>false
    t.integer  "doctor_id",                  :index=>{:name=>"index_visits_on_doctor_id"}
    t.integer  "patient_id",                 :index=>{:name=>"index_visits_on_patient_id"}
    t.integer  "constitution_option_id",     :index=>{:name=>"index_visits_on_constitution_option_id"}, :foreign_key=>{:references=>"constitution_options", :name=>"visits_constitution_option_id_fkey", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "general_state_option_id",    :index=>{:name=>"index_visits_on_general_state_option_id"}
    t.integer  "postural_pose_option_id",    :index=>{:name=>"index_visits_on_postural_pose_option_id"}
    t.integer  "subcutanious_fat_option_id", :index=>{:name=>"index_visits_on_subcutanious_fat_option_id"}
    t.integer  "effleurage_option_id",       :index=>{:name=>"index_visits_on_effleurage_option_id"}
    t.integer  "from_id",                    :index=>{:name=>"fk__visits_from_id"}, :foreign_key=>{:references=>"specialists", :name=>"fk_visits_from_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.string   "an_morbi"
    t.string   "height"
    t.string   "weight"
    t.string   "temp"
    t.datetime "next"
    t.boolean  "secondary",                  :default=>false
    t.boolean  "bool_test"
  end

  create_table "anamnesis_visits", force: :cascade do |t|
    t.integer "visit_id",           :index=>{:name=>"index_anamnesis_visits_on_visit_id"}, :foreign_key=>{:references=>"visits", :name=>"fk_anamnesis_visits_visit_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer "anamnesis_value_id", :index=>{:name=>"index_anamnesis_visits_on_condition_value_id"}, :foreign_key=>{:references=>"anamnesis_values", :name=>"anamnesis_visits_anamnesis_value_id_fkey", :on_update=>:no_action, :on_delete=>:no_action}
    t.string  "details"
  end

  create_table "complication_diagnosis_visits", id: false, force: :cascade do |t|
    t.integer "complication_diagnosis_id"
    t.integer "visit_id"
    t.string  "details"
  end

  create_table "concomitant_diagnosis_visits", id: false, force: :cascade do |t|
    t.integer "concomitant_diagnosis_id"
    t.integer "visit_id"
    t.string  "details"
  end

  create_table "condition_names", force: :cascade do |t|
    t.string   "name"
    t.integer  "condition_type_id"
    t.boolean  "unique"
    t.datetime "created_at",        :null=>false
    t.datetime "updated_at",        :null=>false
  end

  create_table "condition_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "condition_values", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        :null=>false
    t.datetime "updated_at",        :null=>false
    t.integer  "condition_name_id", :index=>{:name=>"index_condition_values_on_condition_name_id"}, :foreign_key=>{:references=>"condition_names", :name=>"condition_values_condition_name_id_fkey", :on_update=>:no_action, :on_delete=>:no_action}
  end

  create_table "condition_visits", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "condition_value_id"
    t.string   "details"
    t.datetime "created_at",         :null=>false
    t.datetime "updated_at",         :null=>false
  end

  create_table "consultation", id: false, force: :cascade do |t|
    t.integer "visit_id",      :null=>false
    t.integer "specialist_id", :null=>false
    t.string  "result"
  end

  create_table "consultations", id: false, force: :cascade do |t|
    t.integer "visit_id",      :null=>false
    t.integer "specialist_id", :null=>false
    t.string  "result"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
    t.string   "name"
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.string   "password_conformation"
    t.string   "specialization"
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_doctors_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_doctors_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "company_name"
    t.text     "company_address"
    t.text     "company_code"
    t.text     "documentation_code"
    t.boolean  "admin"
  end

  create_table "effleurage_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "examinations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "examination_results", force: :cascade do |t|
    t.integer  "examination_id", :index=>{:name=>"index_examination_results_on_examination_id"}, :foreign_key=>{:references=>"examinations", :name=>"examination_results_examination_id_fkey", :on_update=>:no_action, :on_delete=>:no_action}
    t.string   "result"
    t.string   "details"
    t.integer  "visit_id",       :index=>{:name=>"index_examination_results_on_visit_id"}
    t.datetime "created_at",     :null=>false
    t.datetime "updated_at",     :null=>false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at",              :null=>false
    t.datetime "updated_at",              :null=>false
    t.date     "birthday"
    t.string   "surname"
    t.string   "second_name"
    t.text     "address"
    t.text     "registration_address"
    t.text     "phone"
    t.text     "work_phone"
    t.integer  "disability"
    t.text     "work_place"
    t.text     "work_position"
    t.boolean  "dependant"
    t.boolean  "area"
    t.text     "insurance_policy_series"
    t.text     "insurance_policy_number"
    t.integer  "social_benefit_code"
    t.text     "document_series"
    t.text     "document_number"
    t.integer  "martial_status"
    t.integer  "education"
    t.integer  "employment"
    t.boolean  "disability_time"
    t.date     "disability_date"
    t.text     "blood_type"
    t.text     "Rh_factor"
    t.text     "insurance_company"
    t.text     "document_name"
    t.string   "insurance_certificate"
    t.string   "allergy"
    t.boolean  "bool_test"
  end

  create_table "final_diagnosis_lists", force: :cascade do |t|
    t.integer  "diagnosis_id",   :index=>{:name=>"index_final_diagnosis_lists_on_diagnosis_id"}, :foreign_key=>{:references=>"diagnoses", :name=>"fk_final_diagnosis_lists_diagnosis_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "patient_id",     :index=>{:name=>"index_final_diagnosis_lists_on_patient_id"}, :foreign_key=>{:references=>"patients", :name=>"fk_final_diagnosis_lists_patient_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "doctor_id",      :index=>{:name=>"index_final_diagnosis_lists_on_doctor_id"}, :foreign_key=>{:references=>"doctors", :name=>"fk_final_diagnosis_lists_doctor_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.boolean  "diagnosis_time"
    t.datetime "created_at",     :null=>false
    t.datetime "updated_at",     :null=>false
  end

  create_table "froms", force: :cascade do |t|
    t.integer  "visit_id",      :index=>{:name=>"index_froms_on_visit_id"}
    t.integer  "specialist_id", :index=>{:name=>"index_froms_on_specialist_id"}
    t.datetime "created_at",    :null=>false
    t.datetime "updated_at",    :null=>false
  end

  create_table "general_state_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "liver_condition_visits", force: :cascade do |t|
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "liver_conditions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "liver_conditions_visits", id: false, force: :cascade do |t|
    t.integer "visit_id",           :null=>false
    t.integer "liver_condition_id", :null=>false
    t.string  "details"
  end

  create_table "medicines", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "medications", force: :cascade do |t|
    t.integer  "medicine_id", :index=>{:name=>"index_medications_on_medicine_id"}, :foreign_key=>{:references=>"medicines", :name=>"medications_medicine_id_fkey", :on_update=>:no_action, :on_delete=>:no_action}
    t.string   "duration"
    t.integer  "dosage"
    t.string   "details"
    t.integer  "visit_id",    :index=>{:name=>"index_medications_on_visit_id"}
    t.datetime "created_at",  :null=>false
    t.datetime "updated_at",  :null=>false
  end

  create_table "postural_pose_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "primary_diagnosis_visits", id: false, force: :cascade do |t|
    t.datetime "created_at",           :null=>false
    t.datetime "updated_at",           :null=>false
    t.integer  "visit_id"
    t.integer  "primary_diagnosis_id"
    t.string   "details"
  end

  create_table "report_items", force: :cascade do |t|
    t.string   "name"
    t.integer  "quantity"
    t.integer  "percentage"
    t.integer  "parent_id",          :index=>{:name=>"fk__report_items_parent_id"}, :foreign_key=>{:references=>"report_items", :name=>"fk_report_items_parent_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.datetime "created_at",         :null=>false
    t.datetime "updated_at",         :null=>false
    t.integer  "horizontal_counter"
    t.string   "ancestry",           :index=>{:name=>"index_report_items_on_ancestry"}
    t.string   "full_name"
  end

  create_table "subcutanious_fat_options", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", :default=>0
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        :index=>{:name=>"fk__taggings_tag_id"}, :foreign_key=>{:references=>"tags", :name=>"fk_taggings_tag_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "taggable_id",   :index=>{:name=>"index_taggings_on_taggable_id_and_taggable_type_and_context", :with=>["taggable_type", "context"]}
    t.string   "taggable_type", :index=>{:name=>"fk__taggings_taggable_id", :with=>["taggable_id"]}
    t.integer  "tagger_id"
    t.string   "tagger_type",   :index=>{:name=>"fk__taggings_tagger_id", :with=>["tagger_id"]}
    t.string   "context",       :limit=>128
    t.datetime "created_at"
  end
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], :name=>"taggings_idx", :unique=>true

  create_table "treatment_factors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "treatments", force: :cascade do |t|
    t.integer  "treatment_factor_id", :foreign_key=>{:references=>"treatment_factors", :name=>"treatments_treatment_factor_id_fkey", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "amount"
    t.string   "details"
    t.integer  "visit_id"
    t.datetime "created_at",          :null=>false
    t.datetime "updated_at",          :null=>false
  end

end
