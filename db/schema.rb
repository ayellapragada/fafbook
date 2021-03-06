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

ActiveRecord::Schema.define(version: 20170516042215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_albums_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
    t.index ["commentable_type"], name: "index_comments_on_commentable_type", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.string   "friendable_type"
    t.integer  "friendable_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
    t.integer  "status"
  end

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
    t.index ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
    t.index ["liker_id", "liker_type"], name: "fk_likes", using: :btree
  end

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
    t.index ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
    t.index ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "target_type",     null: false
    t.integer  "target_id",       null: false
    t.string   "notifiable_type", null: false
    t.integer  "notifiable_id",   null: false
    t.string   "key",             null: false
    t.string   "group_type"
    t.integer  "group_id"
    t.integer  "group_owner_id"
    t.string   "notifier_type"
    t.integer  "notifier_id"
    t.text     "parameters"
    t.datetime "opened_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["group_owner_id"], name: "index_notifications_on_group_owner_id", using: :btree
    t.index ["group_type", "group_id"], name: "index_notifications_on_group_type_and_group_id", using: :btree
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id", using: :btree
    t.index ["notifier_type", "notifier_id"], name: "index_notifications_on_notifier_type_and_notifier_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "album_id"
    t.text     "caption"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["album_id"], name: "index_photos_on_album_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "body",                     null: false
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "likers_count", default: 0
    t.index ["author_id"], name: "index_posts_on_author_id", using: :btree
    t.index ["receiver_id"], name: "index_posts_on_receiver_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone",        default: ""
    t.string   "education",    default: ""
    t.string   "website",      default: ""
    t.string   "language",     default: ""
    t.string   "location",     default: ""
    t.string   "work",         default: ""
    t.string   "relationship", default: ""
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "about",        default: "Hello!"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "target_type",                             null: false
    t.integer  "target_id",                               null: false
    t.string   "key",                                     null: false
    t.boolean  "subscribing",              default: true, null: false
    t.boolean  "subscribing_to_email",     default: true, null: false
    t.datetime "subscribed_at"
    t.datetime "unsubscribed_at"
    t.datetime "subscribed_to_email_at"
    t.datetime "unsubscribed_to_email_at"
    t.text     "optional_targets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_subscriptions_on_key", using: :btree
    t.index ["target_type", "target_id", "key"], name: "index_subscriptions_on_target_type_and_target_id_and_key", unique: true, using: :btree
    t.index ["target_type", "target_id"], name: "index_subscriptions_on_target_type_and_target_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                      null: false
    t.string   "password_digest",            null: false
    t.string   "session_token",              null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "fname",                      null: false
    t.string   "lname",                      null: false
    t.string   "date",                       null: false
    t.string   "month",                      null: false
    t.string   "year",                       null: false
    t.date     "dob",                        null: false
    t.boolean  "gender",                     null: false
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.string   "cover_photo_file_name"
    t.string   "cover_photo_content_type"
    t.integer  "cover_photo_file_size"
    t.datetime "cover_photo_updated_at"
    t.string   "full_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "albums", "users"
  add_foreign_key "photos", "albums"
  add_foreign_key "posts", "users", column: "author_id"
  add_foreign_key "posts", "users", column: "receiver_id"
  add_foreign_key "profiles", "users"
end
