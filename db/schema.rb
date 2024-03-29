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

ActiveRecord::Schema.define(version: 20180718063528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id", using: :btree
    t.index ["user_id"], name: "index_assignments_on_user_id", using: :btree
  end

  create_table "attributes", force: :cascade do |t|
    t.string   "name",        limit: 64,                null: false
    t.text     "description"
    t.boolean  "status",                 default: true, null: false
    t.string   "code",        limit: 8,                 null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["code", "name"], name: "index_attributes_on_code_and_name", unique: true, using: :btree
  end

  create_table "campus", force: :cascade do |t|
    t.string   "name",        limit: 128,                null: false
    t.string   "code",        limit: 32,                 null: false
    t.string   "description", limit: 512
    t.string   "state",       limit: 64,                 null: false
    t.boolean  "status",                  default: true, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["code"], name: "index_campus_on_code", unique: true, using: :btree
    t.index ["name"], name: "index_campus_on_name", unique: true, using: :btree
  end

  create_table "careers", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name",          limit: 128,                null: false
    t.string   "code",          limit: 32,                 null: false
    t.string   "description",   limit: 512
    t.boolean  "status",                    default: true, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["code"], name: "index_careers_on_code", unique: true, using: :btree
    t.index ["department_id"], name: "index_careers_on_department_id", using: :btree
    t.index ["name"], name: "index_careers_on_name", unique: true, using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 128,                null: false
    t.string   "code",        limit: 16,                 null: false
    t.string   "description", limit: 512
    t.string   "courses",                 default: [],                array: true
    t.integer  "units",                                  null: false
    t.integer  "class_hours",                            null: false
    t.integer  "lab_hours",                              null: false
    t.boolean  "status",                  default: true, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["code"], name: "index_courses_on_code", unique: true, using: :btree
    t.index ["name"], name: "index_courses_on_name", unique: true, using: :btree
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",        limit: 128,                null: false
    t.string   "code",        limit: 32,                 null: false
    t.string   "description", limit: 512
    t.boolean  "status",                  default: true, null: false
    t.integer  "campu_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["campu_id"], name: "index_departments_on_campu_id", using: :btree
    t.index ["code"], name: "index_departments_on_code", unique: true, using: :btree
    t.index ["name"], name: "index_departments_on_name", unique: true, using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "code",        limit: 32,                 null: false
    t.string   "name",        limit: 128,                null: false
    t.string   "description", limit: 512,                null: false
    t.boolean  "status",                  default: true, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["code"], name: "index_roles_on_code", unique: true, using: :btree
  end

  create_table "study_program_courses", force: :cascade do |t|
    t.integer  "semester_number",  null: false
    t.integer  "study_program_id"
    t.integer  "course_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["course_id"], name: "index_study_program_courses_on_course_id", using: :btree
    t.index ["study_program_id"], name: "index_study_program_courses_on_study_program_id", using: :btree
  end

  create_table "study_programs", force: :cascade do |t|
    t.integer  "career_id"
    t.string   "name",        limit: 128,                null: false
    t.string   "description", limit: 512
    t.boolean  "status",                  default: true, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["career_id"], name: "index_study_programs_on_career_id", using: :btree
    t.index ["name"], name: "index_study_programs_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 128,                null: false
    t.string   "last_name",       limit: 128,                null: false
    t.string   "id_college",      limit: 16,                 null: false
    t.string   "password_digest",                            null: false
    t.string   "email",           limit: 64,                 null: false
    t.string   "phone",           limit: 32,                 null: false
    t.string   "gender",          limit: 16,                 null: false
    t.date     "birthday",                                   null: false
    t.boolean  "status",                      default: true, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "assignments", "roles"
  add_foreign_key "assignments", "users"
  add_foreign_key "departments", "campus"
  add_foreign_key "study_program_courses", "courses"
  add_foreign_key "study_program_courses", "study_programs"
end
