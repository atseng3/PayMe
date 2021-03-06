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

ActiveRecord::Schema.define(:version => 20140417053247) do

  create_table "businesses", :force => true do |t|
    t.text     "name",            :null => false
    t.string   "password_digest", :null => false
    t.string   "session_token",   :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "checks", :force => true do |t|
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.float    "tax",        :default => 0.0
    t.float    "tip",        :default => 0.0
    t.boolean  "complete",   :default => false
    t.integer  "user_id"
    t.integer  "busines_id"
  end

  create_table "users", :force => true do |t|
    t.string   "f_name",                          :null => false
    t.string   "l_name",                          :null => false
    t.string   "email",                           :null => false
    t.string   "password_digest",                 :null => false
    t.string   "session_token",                   :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "phone_number",    :default => "", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

end
