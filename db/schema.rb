# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150506063843) do
  create_table "friend_users", force: :cascade do |t|
    t.integer  "friend_id",  limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "friend_users", ["friend_id"], name: "index_friend_users_on_friend_id", using: :btree
  add_index "friend_users", ["user_id"], name: "index_friend_users_on_user_id", using: :btree

  create_table "friends", force: :cascade do |t|
    t.string "name",  limit: 255, null: false
    t.string "rb_id", limit: 255, null: false
  end

  create_table "music_users", force: :cascade do |t|
    t.integer  "music_id",   limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "music_users", ["music_id"], name: "index_music_users_on_music_id", using: :btree
  add_index "music_users", ["user_id"], name: "index_music_users_on_user_id", using: :btree

  create_table "musics", force: :cascade do |t|
    t.string   "name",            limit: 255,             null: false
    t.string   "type",            limit: 255,             null: false
    t.string   "difficulty",      limit: 255,             null: false
    t.integer  "score",           limit: 4
    t.float    "achivement_rate", limit: 24
    t.integer  "clear_level",     limit: 4,   default: 0, null: false
    t.integer  "play_count",      limit: 4,   default: 0, null: false
    t.integer  "miss_count",      limit: 4,   default: 0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "musics", ["name"], name: "index_musics_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255
    t.string   "email",              limit: 255
    t.string   "crypted_password",   limit: 255,             null: false
    t.string   "password_salt",      limit: 255,             null: false
    t.string   "persistence_token",  limit: 255,             null: false
    t.integer  "login_count",        limit: 4,   default: 0, null: false
    t.integer  "failed_login_count", limit: 4,   default: 0, null: false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end
end
