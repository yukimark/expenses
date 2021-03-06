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

ActiveRecord::Schema.define(version: 2022_06_03_110506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "primary_item_lists", comment: "出費の大項目リスト", force: :cascade do |t|
    t.string "name", null: false, comment: "大項目"
    t.integer "user_id", comment: "userと紐づけ"
    t.boolean "initial_flag", default: false, null: false, comment: "初期値の判定"
    t.integer "spend_target_value", default: 0, null: false, comment: "支出の目標値"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "user_id"], name: "index_primary_item_lists_on_name_and_user_id", unique: true
  end

  create_table "spends", comment: "支出を記録する", force: :cascade do |t|
    t.string "content", comment: "内容"
    t.integer "price", null: false, comment: "金額"
    t.integer "user_id", null: false, comment: "userと紐づけ"
    t.integer "primary_item_list_id", comment: "primary_item_listと紐づけ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
