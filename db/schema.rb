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

ActiveRecord::Schema[7.0].define(version: 2023_06_19_155806) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "capacity"
    t.string "address"
    t.string "city"
    t.integer "monthly_price"
    t.boolean "garden"
    t.float "longitude"
    t.float "latitude"
    t.string "type_of_flat"
    t.string "title"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.date "check_in"
    t.bigint "user_id", null: false
    t.bigint "flat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["flat_id"], name: "index_rentals_on_flat_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "birth_day"
    t.string "gender"
    t.string "role"
    t.boolean "admin"
    t.string "study_level"
    t.string "study_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "your_spaces", force: :cascade do |t|
    t.boolean "tv"
    t.boolean "bathroom"
    t.boolean "terrasse"
    t.boolean "wifi"
    t.boolean "toilet"
    t.bigint "flat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_your_spaces_on_flat_id"
  end

  add_foreign_key "flats", "users"
  add_foreign_key "rentals", "flats"
  add_foreign_key "rentals", "users"
  add_foreign_key "your_spaces", "flats"
end
