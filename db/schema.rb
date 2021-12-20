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

ActiveRecord::Schema.define(version: 2021_11_29_234838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "searches", force: :cascade do |t|
    t.string "search_input"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "usertype"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "location"
    t.text "address"
    t.string "zip"
    t.string "description"
    t.text "describe"
    t.boolean "admin", default: false
    t.boolean "event"
    t.boolean "venue"
    t.boolean "press"
    t.boolean "vendor"
    t.boolean "standard"
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "activation_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "usertype"
  end

end
