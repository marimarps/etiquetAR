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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121102163927) do

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "user_id"
  end

  create_table "collections_qrs", :id => false, :force => true do |t|
    t.integer "qr_id",         :null => false
    t.integer "collection_id", :null => false
  end

  add_index "collections_qrs", ["collection_id", "qr_id"], :name => "index_collections_qrs_on_collection_id_and_qr_id"

  create_table "localizations", :force => true do |t|
    t.text     "address"
    t.boolean  "gmaps",      :default => false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "qr_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "localizations", ["id"], :name => "index_localizations_on_id", :unique => true

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "qr_codes", :force => true do |t|
    t.string   "default_resource"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "qrs", :force => true do |t|
    t.string   "default_resource"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.string   "collection_id"
    t.string   "qr_name"
  end

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "uri"
    t.string   "image_location"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "qr_id"
    t.integer  "profile_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
