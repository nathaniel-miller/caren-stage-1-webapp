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

ActiveRecord::Schema.define(version: 2018_06_19_015946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "circles", force: :cascade do |t|
    t.integer "super_admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "important_info_pieces", force: :cascade do |t|
    t.text "description", null: false
    t.bigint "category_id"
    t.bigint "circle_id"
    t.integer "created_by_id"
    t.integer "seen_by", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_important_info_pieces_on_category_id"
    t.index ["circle_id"], name: "index_important_info_pieces_on_circle_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.boolean "accepted", default: false
    t.boolean "rejected", default: false
    t.bigint "position_id"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_invitations_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "circle_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_positions_on_circle_id"
    t.index ["role_id"], name: "index_positions_on_role_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "description", null: false
    t.bigint "circle_id"
    t.bigint "user_id"
    t.boolean "medical", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_posts_on_circle_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_generators", force: :cascade do |t|
    t.text "description", null: false
    t.bigint "category_id"
    t.bigint "circle_id"
    t.integer "created_by_id"
    t.boolean "mandatory", default: false
    t.integer "every_n", default: 1
    t.boolean "sun", default: false
    t.boolean "mon", default: false
    t.boolean "tues", default: false
    t.boolean "wed", default: false
    t.boolean "thurs", default: false
    t.boolean "fri", default: false
    t.boolean "sat", default: false
    t.integer "part_of_day", default: 1
    t.time "custom_time"
    t.datetime "last_run"
    t.integer "look_ahead", default: 7
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_task_generators_on_category_id"
    t.index ["circle_id"], name: "index_task_generators_on_circle_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description", null: false
    t.datetime "expiration_date"
    t.boolean "completed", default: false
    t.integer "completed_by_id"
    t.integer "created_by_id"
    t.bigint "category_id"
    t.bigint "task_generator_id"
    t.bigint "circle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_tasks_on_category_id"
    t.index ["circle_id"], name: "index_tasks_on_circle_id"
    t.index ["task_generator_id"], name: "index_tasks_on_task_generator_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "circles", "users", column: "super_admin_id"
  add_foreign_key "important_info_pieces", "categories"
  add_foreign_key "important_info_pieces", "circles"
  add_foreign_key "important_info_pieces", "users", column: "created_by_id"
  add_foreign_key "invitations", "positions"
  add_foreign_key "invitations", "users", column: "recipient_id"
  add_foreign_key "invitations", "users", column: "sender_id"
  add_foreign_key "positions", "circles"
  add_foreign_key "positions", "roles"
  add_foreign_key "posts", "circles"
  add_foreign_key "posts", "users"
  add_foreign_key "task_generators", "categories"
  add_foreign_key "task_generators", "circles"
  add_foreign_key "task_generators", "users", column: "created_by_id"
  add_foreign_key "tasks", "categories"
  add_foreign_key "tasks", "circles"
  add_foreign_key "tasks", "task_generators"
  add_foreign_key "tasks", "users", column: "completed_by_id"
  add_foreign_key "tasks", "users", column: "created_by_id"
end
