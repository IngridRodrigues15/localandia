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

ActiveRecord::Schema.define(version: 2020_08_05_133701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_types", force: :cascade do |t|
    t.string "name"
    t.text "skills"
    t.text "weapons"
    t.integer "mana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "characteristics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "games", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "sheet_id"
    t.bigint "item_id"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_inventories_on_item_id"
    t.index ["sheet_id"], name: "index_inventories_on_sheet_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.bigint "sheet_id"
    t.bigint "user_id"
    t.string "nome"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "game_id"
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["sheet_id"], name: "index_players_on_sheet_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "sheet_characteristics", force: :cascade do |t|
    t.bigint "sheet_id"
    t.bigint "characteristic_id"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["characteristic_id"], name: "index_sheet_characteristics_on_characteristic_id"
    t.index ["sheet_id"], name: "index_sheet_characteristics_on_sheet_id"
  end

  create_table "sheets", force: :cascade do |t|
    t.integer "rubies"
    t.integer "life"
    t.integer "mana"
    t.integer "heroic_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "character_type_id"
    t.index ["character_type_id"], name: "index_sheets_on_character_type_id"
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

  add_foreign_key "players", "games"
  add_foreign_key "sheets", "character_types"
end
