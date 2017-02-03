class ImportOldSchema < ActiveRecord::Migration[5.0]
  def change
    create_table "organizations", force: :cascade do |t|
  t.string   "name",       null: false
  t.string   "uniq_name",  null: false
  t.string   "domain",     null: false
  t.integer  "user_id",    null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.string   "slug"
  t.index ["slug"], name: "index_organizations_on_slug", unique: true, using: :btree
  t.index ["uniq_name"], name: "index_organizations_on_uniq_name", using: :btree
  t.index ["user_id"], name: "index_organizations_on_user_id", using: :btree
end

create_table "reports", force: :cascade do |t|
  t.integer  "organization_id"
  t.date     "issue_date",                      null: false
  t.boolean  "letters",         default: false, null: false
  t.datetime "created_at",                      null: false
  t.datetime "updated_at",                      null: false
  t.index ["organization_id"], name: "index_reports_on_organization_id", using: :btree
end
add_foreign_key "organizations", "users"
add_foreign_key "reports", "organizations"

  end
end
