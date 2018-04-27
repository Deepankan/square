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

ActiveRecord::Schema.define(version: 20180426182022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "squares", force: :cascade do |t|
    t.string "previous_color"
    t.string "current_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
  end

  create_table "user_squares", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "square_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.index ["square_id"], name: "index_user_squares_on_square_id"
    t.index ["user_id"], name: "index_user_squares_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_squares", "squares"
  add_foreign_key "user_squares", "users"
end
