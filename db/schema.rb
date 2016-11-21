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

ActiveRecord::Schema.define(version: 20161121205758) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.decimal  "amount"
    t.date     "expiration_date"
    t.string   "status"
    t.string   "uuid"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pledges", ["project_id"], name: "index_pledges_on_project_id"
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "summary"
    t.text     "description"
    t.string   "image_url"
    t.integer  "location_id"
    t.integer  "category_id"
    t.integer  "skill_id"
    t.decimal  "goal",                  precision: 8, scale: 2
    t.datetime "expiration_date"
    t.string   "status",                                        default: "pending"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "resource_file_name"
    t.string   "resource_content_type"
    t.integer  "resource_file_size"
    t.datetime "resource_updated_at"
    t.string   "image"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"
  add_index "projects", ["location_id"], name: "index_projects_on_location_id"
  add_index "projects", ["skill_id"], name: "index_projects_on_skill_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "provider"
    t.integer  "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
