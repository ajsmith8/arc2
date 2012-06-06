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

ActiveRecord::Schema.define(:version => 20120529203140) do

  create_table "categories", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "category_relationships", :force => true do |t|
    t.integer   "category_id"
    t.integer   "t_id"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.integer   "user_id"
  end

  create_table "reasons", :force => true do |t|
    t.integer   "t_id"
    t.string    "question"
    t.string    "title"
    t.text      "description"
    t.integer   "score"
    t.boolean   "is_pro"
    t.string    "correct_answer"
    t.string    "wrong_answer1"
    t.string    "wrong_answer2"
    t.string    "wrong_answer3"
    t.timestamp "created_at",     :null => false
    t.timestamp "updated_at",     :null => false
  end

  create_table "sessions", :force => true do |t|
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "temp_activities", :force => true do |t|
    t.integer   "user_id"
    t.integer   "t1_id"
    t.integer   "t2_id"
    t.string    "friend_question1"
    t.string    "friend_question2"
    t.string    "friend_question3"
    t.string    "friend_question4"
    t.string    "why_fail1"
    t.string    "why_fail2"
    t.timestamp "created_at",       :null => false
    t.timestamp "updated_at",       :null => false
    t.boolean   "quiz1"
    t.boolean   "quiz2"
    t.boolean   "quiz3"
    t.boolean   "quiz4"
  end

  create_table "ts", :force => true do |t|
    t.string    "title"
    t.text      "description"
    t.string    "url"
    t.integer   "score"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.string    "majority"
  end

  create_table "users", :force => true do |t|
    t.string    "provider"
    t.string    "uid"
    t.string    "name"
    t.string    "email"
    t.timestamp "created_at",                    :null => false
    t.timestamp "updated_at",                    :null => false
    t.boolean   "is_admin",   :default => false
    t.boolean   "is_temp",    :default => true
  end

end
