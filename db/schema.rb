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

ActiveRecord::Schema.define(:version => 20131108025519) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "status"
    t.datetime "agenda"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_id"
    t.string   "marital_status"
    t.datetime "expiration_date"
    t.string   "state"
    t.string   "afinity"
  end

  create_table "clients_users", :id => false, :force => true do |t|
    t.integer "client_id", :null => false
    t.integer "user_id",   :null => false
  end

  add_index "clients_users", ["client_id", "user_id"], :name => "index_clients_users_on_client_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind_of_user"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vehicles", :force => true do |t|
    t.integer  "client_id"
    t.string   "brand"
    t.string   "model"
    t.string   "version"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["client_id"], :name => "index_vehicles_on_client_id"

end
