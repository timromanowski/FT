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

ActiveRecord::Schema.define(version: 20160329050141) do

  create_table "games", force: :cascade do |t|
    t.string   "label",          limit: 255
    t.string   "name",           limit: 255
    t.string   "slug",           limit: 255
    t.string   "title",          limit: 255
    t.integer  "timestamp",      limit: 4
    t.datetime "started_at"
    t.integer  "home_team_id",   limit: 4
    t.integer  "away_team_id",   limit: 4
    t.integer  "venue_id",       limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "stattleship_id", limit: 255
    t.integer  "league_id",      limit: 4
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "stattleship_id", limit: 255
    t.string   "name",           limit: 255
    t.string   "slug",           limit: 255
    t.string   "abbreviation",   limit: 255
    t.string   "sport",          limit: 255
    t.string   "logo",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "location_games", force: :cascade do |t|
    t.integer  "location_id", limit: 4
    t.integer  "game_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "location_sports_subscriptions", force: :cascade do |t|
    t.integer  "location_id",            limit: 4
    t.integer  "sports_subscription_id", limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "sport_bar_id",         limit: 4
    t.string   "name",                 limit: 255
    t.text     "location_description", limit: 65535
    t.string   "logo",                 limit: 255
    t.string   "address1",             limit: 255
    t.string   "address2",             limit: 255
    t.string   "city",                 limit: 255
    t.string   "region",               limit: 255
    t.string   "country",              limit: 255
    t.string   "postal_code",          limit: 255
    t.float    "latitude",             limit: 24
    t.float    "longitude",            limit: 24
    t.string   "phone_number",         limit: 255
    t.string   "email",                limit: 255
    t.string   "website",              limit: 255
    t.string   "facebook_page",        limit: 255
    t.string   "twitter_handle",       limit: 255
    t.integer  "tv_count",             limit: 4
    t.string   "permalink",            limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "sports_bars", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "hashtag",        limit: 255
    t.text     "description",    limit: 65535
    t.string   "logo",           limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "email",          limit: 255
    t.string   "website",        limit: 255
    t.string   "facebook_page",  limit: 255
    t.string   "twitter_handle", limit: 255
    t.string   "permalink",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "sports_subscriptions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "logo_file",  limit: 255
    t.string   "provider",   limit: 255
    t.integer  "league_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "hashtag",        limit: 255
    t.integer  "league_id",      limit: 4
    t.integer  "venue_id",       limit: 4
    t.string   "location",       limit: 255
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.string   "name",           limit: 255
    t.string   "nickname",       limit: 255
    t.string   "slug",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "stattleship_id", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "abbreviation",   limit: 255
    t.string   "city",           limit: 255
    t.string   "country",        limit: 255
    t.string   "field_type",     limit: 255
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.string   "name",           limit: 255
    t.string   "slug",           limit: 255
    t.string   "state",          limit: 255
    t.string   "time_zone",      limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "stattleship_id", limit: 255
  end

end
