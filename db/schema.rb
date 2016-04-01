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

ActiveRecord::Schema.define(version: 20160330175261) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",                       null: false
    t.datetime "start_at",                    null: false
    t.datetime "end_at"
    t.string   "address"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.string   "image"
    t.integer  "count_views", default: 0
    t.string   "type"
    t.boolean  "manual",      default: true
    t.boolean  "publish",     default: false
    t.string   "region"
    t.integer  "category_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id", using: :btree

  create_table "reminders", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "event_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reminders", ["event_id"], name: "index_reminders_on_event_id", using: :btree
  add_index "reminders", ["user_id"], name: "index_reminders_on_user_id", using: :btree

  create_table "suscriptors", force: :cascade do |t|
    t.string "email"
    t.string "fullname"
    t.string "phone"
    t.string "name_business"
    t.string "type"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fullname",                 null: false
    t.string   "username",                 null: false
    t.string   "email",                    null: false
    t.string   "phone"
    t.integer  "sex"
    t.date     "birthdate"
    t.string   "provider",                 null: false
    t.string   "auth_token",               null: false
    t.string   "uid",                      null: false
    t.integer  "friend_count", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "events", "categories"
  add_foreign_key "reminders", "events"
  add_foreign_key "reminders", "users"
end
