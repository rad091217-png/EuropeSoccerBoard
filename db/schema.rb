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

ActiveRecord::Schema.define(version: 2021_03_18_043005) do

  create_table "bundesu_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entries", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "room_id"
  end

  create_table "eredivisie_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "euro_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "jupiler_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "laliga_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
  end

  create_table "league_one_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "room_id"
  end

  create_table "nations_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "premera_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "premier_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "room_id"
  end

  create_table "scotish_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "serie_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.integer "user_id"
    t.string "introduction"
    t.string "avatar_cache"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
