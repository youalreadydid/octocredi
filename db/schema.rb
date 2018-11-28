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

ActiveRecord::Schema.define(version: 2018_11_28_134110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "licenses", force: :cascade do |t|
    t.text "key"
    t.text "name"
    t.text "spdx_id"
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_licenses_on_key", unique: true
  end

  create_table "repos", force: :cascade do |t|
    t.integer "github_id"
    t.text "name"
    t.text "full_name"
    t.bigint "owner_id"
    t.text "html_url"
    t.text "description"
    t.boolean "fork"
    t.text "url"
    t.datetime "repo_created_at"
    t.datetime "repo_updated_at"
    t.datetime "repo_pushed_at"
    t.text "homepage"
    t.integer "size"
    t.integer "stargazers_count"
    t.integer "watchers_count"
    t.integer "forks_count"
    t.integer "open_issues_count"
    t.text "language"
    t.boolean "has_issues"
    t.boolean "has_projects"
    t.boolean "has_downloads"
    t.boolean "has_wiki"
    t.boolean "has_pages"
    t.boolean "archived"
    t.text "default_branch"
    t.bigint "license_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["github_id"], name: "index_repos_on_github_id", unique: true
    t.index ["license_id"], name: "index_repos_on_license_id"
    t.index ["owner_id"], name: "index_repos_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "login"
    t.integer "github_id"
    t.text "avatar_url"
    t.text "gravatar_id"
    t.text "url"
    t.text "html_url"
    t.text "user_type"
    t.boolean "site_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

  add_foreign_key "repos", "licenses"
  add_foreign_key "repos", "users", column: "owner_id"
end
