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

ActiveRecord::Schema.define(version: 2022_01_26_031909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.integer "workTime"
    t.integer "studyTime"
    t.integer "diffculty"
    t.integer "timeWish"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    #t.string "course_title"
    #t.string "course_code"
    #t.string "professor"
    #t.string "university"  # Should we add this? May help with this. Require student to put uni to post.
  end

  create_table "users", primary_key: "username", id: :string, force: :cascade do |t|
    t.string "password_hash"
    t.string "type_of_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "reviews_id"
    t.index ["reviews_id"], name: "index_users_on_reviews_id"
  end

  add_foreign_key "users", "reviews", column: "reviews_id"
end
