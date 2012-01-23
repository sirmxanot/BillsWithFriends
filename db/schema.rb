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

ActiveRecord::Schema.define(:version => 20120123170810) do

  create_table "expenses", :force => true do |t|
    t.string   "expense_name"
    t.integer  "owner_id"
    t.date     "date_incurred"
    t.integer  "total_amount"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "i_paid_yous", :force => true do |t|
    t.integer  "payment_id"
    t.integer  "amount"
    t.integer  "payer_id"
    t.integer  "receiver_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "owner_id"
    t.datetime "date_paid"
    t.integer  "total_amount"
    t.string   "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.datetime "ceated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registers", :force => true do |t|
    t.integer  "creditor_id"
    t.integer  "debtor_id"
    t.integer  "credit_extended"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "you_owe_mes", :force => true do |t|
    t.integer  "expense_id"
    t.integer  "amount"
    t.integer  "creditor_id"
    t.integer  "debtor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
