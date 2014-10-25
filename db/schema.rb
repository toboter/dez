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

ActiveRecord::Schema.define(version: 20141024093916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artefact_identificators", force: true do |t|
    t.string   "name"
    t.integer  "excavation_id"
    t.integer  "artefact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fjno"
  end

  create_table "artefacts", force: true do |t|
    t.integer  "dez"
    t.string   "dez_index"
    t.string   "dimensions"
    t.integer  "dimensions_type"
    t.string   "weight"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.boolean  "in_exhibition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.string   "language"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dispositions", force: true do |t|
    t.datetime "receipt_date"
    t.integer  "artefact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "excavations", force: true do |t|
    t.string   "name"
    t.integer  "dai_gazetter_id"
    t.string   "shortcut"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restorations", force: true do |t|
    t.datetime "date_of_action"
    t.integer  "artefact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specifications", force: true do |t|
    t.integer  "vocabulary_id"
    t.integer  "specifyable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "specifyable_type"
  end

  add_index "specifications", ["specifyable_id"], name: "index_specifications_on_specifyable_id", using: :btree
  add_index "specifications", ["specifyable_type"], name: "index_specifications_on_specifyable_type", using: :btree
  add_index "specifications", ["vocabulary_id"], name: "index_specifications_on_vocabulary_id", using: :btree

  create_table "terms", force: true do |t|
    t.integer  "vocabulary_id"
    t.string   "name"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "terms", ["vocabulary_id"], name: "index_terms_on_vocabulary_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vocabularies", force: true do |t|
    t.string   "record_type"
    t.integer  "parent_id"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabulary_hierarchies", id: false, force: true do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "vocabulary_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "anc_desc_idx", unique: true, using: :btree
  add_index "vocabulary_hierarchies", ["descendant_id"], name: "desc_idx", using: :btree

end
