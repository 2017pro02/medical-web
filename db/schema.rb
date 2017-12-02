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

ActiveRecord::Schema.define(version: 20171202084647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "target_user_id"
    t.date "target_date", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["target_user_id"], name: "index_comments_on_target_user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.bigint "nutrition_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id", "nutrition_id"], name: "index_dishes_on_meal_id_and_nutrition_id", unique: true
    t.index ["meal_id"], name: "index_dishes_on_meal_id"
    t.index ["nutrition_id"], name: "index_dishes_on_nutrition_id"
  end

  create_table "dris", force: :cascade do |t|
    t.string "nut_type", null: false
    t.integer "gender", null: false
    t.int4range "age", null: false
    t.float "val", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nut_type", "gender", "age"], name: "index_dris_on_nut_type_and_gender_and_age", unique: true
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "user_id"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "nutritions", force: :cascade do |t|
    t.string "name", null: false
    t.string "img"
    t.float "energy"
    t.float "protein"
    t.float "lipid"
    t.float "carbohydrate"
    t.float "dietary_fiber"
    t.float "saturated_fatty_acid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relations", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relations_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relations_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relations_on_follower_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "username", null: false
    t.string "nickname"
    t.string "avatar"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
    t.index ["username"], name: "index_user_profiles_on_username", unique: true
  end

  create_table "users", force: :cascade do |t|
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
    t.boolean "is_admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "comments", "users", column: "target_user_id"
  add_foreign_key "dishes", "meals"
  add_foreign_key "dishes", "nutritions"
  add_foreign_key "meals", "users"
  add_foreign_key "user_profiles", "users"
end
