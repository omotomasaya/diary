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

ActiveRecord::Schema[7.0].define(version: 2023_02_11_144641) do
  create_table "admin_users", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "app_users", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["confirmation_token"], name: "index_app_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_app_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_app_users_on_reset_password_token", unique: true
  end

  create_table "categories", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.integer "sort_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diaries", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.date "calendar_date", null: false
    t.bigint "app_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_user_id"], name: "index_diaries_on_app_user_id"
  end

  create_table "diary_categories", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.bigint "diary_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_diary_categories_on_category_id"
    t.index ["diary_id"], name: "index_diary_categories_on_diary_id"
  end

  create_table "notifications", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "diaries", "app_users"
  add_foreign_key "diary_categories", "categories"
  add_foreign_key "diary_categories", "diaries"
end
