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

ActiveRecord::Schema.define(version: 20140118192856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.string   "name"
    t.string   "link"
    t.string   "avatar"
    t.text     "full_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.string   "key"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "garages", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.text     "link"
    t.string   "tags",                  default: [], array: true
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "products_count"
    t.text     "latitude"
    t.text     "longitude"
    t.text     "street"
    t.text     "city"
    t.text     "state"
    t.text     "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "garages", ["cached_votes_down"], name: "index_garages_on_cached_votes_down", using: :btree
  add_index "garages", ["cached_votes_score"], name: "index_garages_on_cached_votes_score", using: :btree
  add_index "garages", ["cached_votes_total"], name: "index_garages_on_cached_votes_total", using: :btree
  add_index "garages", ["cached_votes_up"], name: "index_garages_on_cached_votes_up", using: :btree
  add_index "garages", ["cached_weighted_score"], name: "index_garages_on_cached_weighted_score", using: :btree
  add_index "garages", ["slug"], name: "index_garages_on_slug", unique: true, using: :btree
  add_index "garages", ["user_id"], name: "index_garages_on_user_id", using: :btree

  create_table "media", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.boolean  "new_product",        default: true
    t.string   "descrition"
    t.integer  "order"
    t.integer  "status",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "media", ["product_id"], name: "index_media_on_product_id", using: :btree
  add_index "media", ["user_id"], name: "index_media_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.integer  "garage_id"
    t.string   "name",                                null: false
    t.string   "slug"
    t.text     "description"
    t.float    "value",                 default: 0.0
    t.string   "currency",                            null: false
    t.string   "tags",                  default: [],               array: true
    t.integer  "media_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",    default: 0
    t.integer  "cached_votes_score",    default: 0
    t.integer  "cached_votes_up",       default: 0
    t.integer  "cached_votes_down",     default: 0
    t.integer  "cached_weighted_score", default: 0
  end

  add_index "products", ["cached_votes_down"], name: "index_products_on_cached_votes_down", using: :btree
  add_index "products", ["cached_votes_score"], name: "index_products_on_cached_votes_score", using: :btree
  add_index "products", ["cached_votes_total"], name: "index_products_on_cached_votes_total", using: :btree
  add_index "products", ["cached_votes_up"], name: "index_products_on_cached_votes_up", using: :btree
  add_index "products", ["cached_weighted_score"], name: "index_products_on_cached_weighted_score", using: :btree
  add_index "products", ["garage_id"], name: "index_products_on_garage_id", using: :btree
  add_index "products", ["tags"], name: "index_products_on_tags", using: :gin

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
