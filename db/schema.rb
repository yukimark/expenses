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

ActiveRecord::Schema.define(version: 2022_05_26_042555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "spends", comment: "支出を記録する", force: :cascade do |t|
    t.string "content", comment: "内容"
    t.integer "price", null: false, comment: "金額"
    t.string "b_item", comment: "大項目"
    t.string "c_item", comment: "中項目"
    t.text "memo", comment: "メモ"
    t.datetime "deleted_at", comment: "論理削除用"
    t.integer "user_id", null: false, comment: "ユーザーID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
