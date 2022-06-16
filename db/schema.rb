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

ActiveRecord::Schema[7.0].define(version: 2022_06_16_225941) do
  create_table "chess_games", force: :cascade do |t|
    t.integer "black_player_id"
    t.integer "white_player_id"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "draw", default: false
    t.integer "loser_id"
  end

  create_table "leader_board_changes", force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "from"
    t.integer "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_leader_board_changes_on_member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "surname"
    t.string "email_address"
    t.string "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank", default: 0
    t.integer "previous_rank"
  end

  add_foreign_key "leader_board_changes", "members"
end
