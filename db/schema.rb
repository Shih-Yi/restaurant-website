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

ActiveRecord::Schema.define(version: 2025_05_01_000003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "dish_group_images", force: :cascade do |t|
    t.bigint "dish_group_id", null: false
    t.string "image"
    t.string "title"
    t.integer "position"
    t.string "image_type"
    t.string "image_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dish_group_id"], name: "index_dish_group_images_on_dish_group_id"
  end

  create_table "dish_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "group_type"
    t.integer "position"
    t.boolean "published", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.string "english_name"
    t.string "chinese_name"
    t.float "small_price"
    t.float "large_price"
    t.string "dish_type"
    t.integer "position"
    t.boolean "published", default: true
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dish_group_id"
    t.index ["dish_group_id"], name: "index_dishes_on_dish_group_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean "published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "intro_image"
    t.string "menu_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "dish_group_images", "dish_groups"
  add_foreign_key "dishes", "dish_groups"
end
