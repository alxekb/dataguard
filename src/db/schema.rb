# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_16_232604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_unit_people", force: :cascade do |t|
    t.bigint "company_unit_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_unit_id"], name: "index_company_unit_people_on_company_unit_id"
    t.index ["person_id"], name: "index_company_unit_people_on_person_id"
  end

  create_table "company_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lunch_event_people", force: :cascade do |t|
    t.bigint "lunch_event_id", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lunch_event_id"], name: "index_lunch_event_people_on_lunch_event_id"
    t.index ["person_id"], name: "index_lunch_event_people_on_person_id"
  end

  create_table "lunch_events", force: :cascade do |t|
    t.bigint "venue_id", null: false
    t.datetime "scheduled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_lunch_events_on_venue_id"
  end

  create_table "lunch_events_groups", force: :cascade do |t|
    t.bigint "leader_id", null: false
    t.bigint "lunch_event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leader_id"], name: "index_lunch_events_groups_on_leader_id"
    t.index ["lunch_event_id"], name: "index_lunch_events_groups_on_lunch_event_id"
  end

  create_table "lunch_events_groups_memberships", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_lunch_events_groups_memberships_on_group_id"
    t.index ["member_id"], name: "index_lunch_events_groups_memberships_on_member_id"
  end

  create_table "people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "company_unit_people", "company_units"
  add_foreign_key "company_unit_people", "people"
  add_foreign_key "lunch_event_people", "lunch_events"
  add_foreign_key "lunch_event_people", "people"
  add_foreign_key "lunch_events", "venues"
  add_foreign_key "lunch_events_groups", "lunch_events"
  add_foreign_key "lunch_events_groups", "people", column: "leader_id"
  add_foreign_key "lunch_events_groups_memberships", "lunch_events_groups", column: "group_id"
  add_foreign_key "lunch_events_groups_memberships", "people", column: "member_id"
end
