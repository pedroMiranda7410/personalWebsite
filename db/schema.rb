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

ActiveRecord::Schema.define(version: 2019_10_10_121911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributors", force: :cascade do |t|
    t.string "github", default: "", null: false
    t.string "user_id", default: "0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_id"
    t.index ["post_id"], name: "index_contributors_on_post_id"
  end

  create_table "cool_phrases", force: :cascade do |t|
    t.string "phrase", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_objectives", force: :cascade do |t|
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "sub_title", default: "", null: false
    t.string "objective", default: "", null: false
    t.string "sub_description", default: "", null: false
    t.string "description", default: "", null: false
    t.string "language", default: "", null: false
    t.string "pdf", default: "", null: false
    t.string "readme", default: "", null: false
    t.string "video", default: "", null: false
    t.string "photo", default: "", null: false
    t.string "summary_file_zip", default: "", null: false
    t.string "github_repo_name", default: "", null: false
    t.string "github_owner_name", default: "", null: false
    t.string "github_branch_name", default: "master", null: false
    t.boolean "admin_verification", default: false, null: false
    t.boolean "get_from_github", default: false, null: false
    t.string "files_zip_file_name"
    t.string "files_zip_content_type"
    t.integer "files_zip_file_size"
    t.datetime "files_zip_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "sub_title", default: "", null: false
    t.string "objective", default: "", null: false
    t.string "sub_description", default: "", null: false
    t.string "description", default: "", null: false
    t.string "language", default: "", null: false
    t.string "pdf", default: "", null: false
    t.string "readme", default: "", null: false
    t.string "video", default: "", null: false
    t.string "image", default: "", null: false
    t.string "summary_file_zip", default: "", null: false
    t.string "files_zip_file_name"
    t.string "files_zip_content_type"
    t.integer "files_zip_file_size"
    t.datetime "files_zip_updated_at"
    t.string "github_repo_name", default: "", null: false
    t.string "github_owner_name", default: "", null: false
    t.string "github_branch_name", default: "master", null: false
    t.boolean "principal", default: false, null: false
    t.boolean "get_from_github", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "summaries", force: :cascade do |t|
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest", default: "", null: false
    t.string "name", default: "", null: false
    t.string "nickname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "github", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.integer "login_count", default: 0, null: false
    t.integer "tamo_junto", default: 0, null: false
    t.integer "eu_quem_agradeco", default: 0, null: false
    t.boolean "first_time", default: true, null: false
    t.boolean "show_notification", default: true, null: false
    t.boolean "backgroung_image_display", default: true, null: false
    t.integer "filter", default: 0, null: false
    t.integer "background_image_choose", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "contributors", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "projects", "users"
end
