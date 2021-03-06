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

ActiveRecord::Schema.define(version: 2020_06_18_183540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_resources", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses_videos", force: :cascade do |t|
    t.integer "video_resource_id"
    t.integer "course_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "digest_password"
  end

  create_table "video_resources", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
