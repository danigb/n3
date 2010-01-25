# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 18) do

  create_table "item_images", :force => true do |t|
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size"
    t.integer  "item_id"
    t.string   "thumbnail"
    t.integer  "width"
    t.integer  "height"
    t.string   "title"
    t.string   "extra"
    t.string   "position"
    t.datetime "created_on"
    t.integer  "parent_id"
    t.integer  "listpos"
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.string   "content",        :limit => 4096
    t.integer  "time_period_id"
    t.string   "category"
    t.string   "subcategory"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.integer  "item_image_id"
    t.string   "extra"
    t.string   "link"
    t.string   "position"
  end

  create_table "service_offers", :force => true do |t|
    t.text    "type"
    t.text    "content",       :null => false
    t.integer "item_image_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
