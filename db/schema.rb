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

ActiveRecord::Schema.define(version: 2019_11_13_143116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.bigint "user_id"
    t.string "body"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "commontator_comments", force: :cascade do |t|
    t.bigint "thread_id", null: false
    t.string "creator_type", null: false
    t.bigint "creator_id", null: false
    t.string "editor_type"
    t.bigint "editor_id"
    t.text "body", null: false
    t.datetime "deleted_at"
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.index ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down"
    t.index ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up"
    t.index ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id"
    t.index ["editor_type", "editor_id"], name: "index_commontator_comments_on_editor_type_and_editor_id"
    t.index ["parent_id"], name: "index_commontator_comments_on_parent_id"
    t.index ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at"
  end

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.bigint "thread_id", null: false
    t.string "subscriber_type", null: false
    t.bigint "subscriber_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true
    t.index ["thread_id"], name: "index_commontator_subscriptions_on_thread_id"
  end

  create_table "commontator_threads", force: :cascade do |t|
    t.string "commontable_type"
    t.bigint "commontable_id"
    t.string "closer_type"
    t.bigint "closer_id"
    t.datetime "closed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["closer_type", "closer_id"], name: "index_commontator_threads_on_closer_type_and_closer_id"
    t.index ["commontable_type", "commontable_id"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "wall_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "commontator_comments", "commontator_comments", column: "parent_id", on_update: :restrict, on_delete: :cascade
  add_foreign_key "commontator_comments", "commontator_threads", column: "thread_id", on_update: :cascade, on_delete: :cascade
  add_foreign_key "commontator_subscriptions", "commontator_threads", column: "thread_id", on_update: :cascade, on_delete: :cascade
end
