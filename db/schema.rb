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

ActiveRecord::Schema[7.0].define(version: 2024_08_21_155412) do
  create_table "comments", charset: "utf8", force: :cascade do |t|
    t.text "content", null: false
    t.bigint "user_id"
    t.bigint "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_comments_on_mission_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "levels", charset: "utf8", force: :cascade do |t|
    t.integer "number", null: false
    t.bigint "user_id"
    t.bigint "mission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mission_id"], name: "index_levels_on_mission_id"
    t.index ["user_id"], name: "index_levels_on_user_id"
  end

  create_table "missions", charset: "utf8", force: :cascade do |t|
    t.string "goal", null: false
    t.string "mission1", null: false
    t.string "mission2", null: false
    t.string "mission3", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "remember_created_at"
    t.string "role"
  end

  add_foreign_key "comments", "missions", on_delete: :cascade
  add_foreign_key "comments", "users"
  add_foreign_key "levels", "missions"
  add_foreign_key "levels", "users"
  add_foreign_key "missions", "users"
end
