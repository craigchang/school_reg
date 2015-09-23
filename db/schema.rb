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

ActiveRecord::Schema.define(version: 20150921053028) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_number"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "courses", ["name"], name: "index_courses_on_name"

  create_table "enrollments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.string   "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id"
  add_index "enrollments", ["student_id", "course_id"], name: "index_enrollments_on_student_id_and_course_id"
  add_index "enrollments", ["student_id"], name: "index_enrollments_on_student_id"

  create_table "parents", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents_students", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "parent_id"
  end

  add_index "parents_students", ["parent_id"], name: "index_parents_students_on_parent_id"
  add_index "parents_students", ["student_id", "parent_id"], name: "index_parents_students_on_student_id_and_parent_id"
  add_index "parents_students", ["student_id"], name: "index_parents_students_on_student_id"

  create_table "students", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "grade"
    t.string   "home_phone_number"
    t.string   "cell_phone_number"
    t.string   "email"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "students", ["address_id"], name: "index_students_on_address_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.integer  "enrollment_id"
    t.string   "category"
    t.string   "name"
    t.boolean  "is_submitted"
    t.string   "grade"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "score"
    t.integer  "max_score"
  end

  add_index "tasks", ["enrollment_id"], name: "index_tasks_on_enrollment_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
