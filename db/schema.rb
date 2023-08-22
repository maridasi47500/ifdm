# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_08_22_005916) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "image"
    t.string "icon"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
  end

  create_table "houruserweekdays", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "userweekday_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "payonce"
    t.string "moyen"
    t.integer "option"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
  end

  create_table "userhascourses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.date "dateofbirth"
    t.string "resp_firstname"
    t.string "resp_lastname"
    t.text "address"
    t.string "zip"
    t.string "city"
    t.string "mobile"
    t.string "landline"
    t.integer "level_id"
    t.boolean "film"
    t.boolean "internet"
    t.boolean "fb"
    t.boolean "insta"
    t.boolean "yt"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "tva"
    t.string "societe"
    t.string "complementadresse"
    t.string "civilite"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "userweekdays", force: :cascade do |t|
    t.integer "user_id"
    t.integer "weekday_id"
  end

  create_table "webbillets", force: :cascade do |t|
    t.string "flyer"
    t.string "url"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weekdays", force: :cascade do |t|
    t.string "name"
  end

end
