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

ActiveRecord::Schema[7.1].define(version: 2026_04_27_100514) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "booking_date"
    t.float "total_ammount"
    t.string "status"
    t.integer "ticket_count"
    t.bigint "user_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seat_number"
    t.index ["schedule_id", "seat_number"], name: "index_bookings_on_schedule_id_and_seat_number", unique: true
    t.index ["schedule_id"], name: "index_bookings_on_schedule_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "bus_partners", force: :cascade do |t|
    t.string "name"
    t.string "contact_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buses", force: :cascade do |t|
    t.string "bus_number"
    t.integer "level"
    t.string "bus_type"
    t.integer "capacity"
    t.bigint "bus_partner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_partner_id"], name: "index_buses_on_bus_partner_id"
  end

  create_table "route_stops", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "stop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["route_id"], name: "index_route_stops_on_route_id"
    t.index ["stop_id"], name: "index_route_stops_on_stop_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "start_location"
    t.string "destination"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "bus_id", null: false
    t.bigint "route_id", null: false
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_schedules_on_bus_id"
    t.index ["route_id"], name: "index_schedules_on_route_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "seat_type"
    t.integer "seat_number"
    t.bigint "bus_id", null: false
    t.integer "position_deck"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bus_id"], name: "index_seats_on_bus_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "stop_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "seat_number"
    t.string "passanger_name"
    t.integer "passanger_age"
    t.bigint "seat_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
    t.index ["seat_id"], name: "index_tickets_on_seat_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "role", default: "user"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "schedules"
  add_foreign_key "bookings", "users"
  add_foreign_key "buses", "bus_partners"
  add_foreign_key "route_stops", "routes"
  add_foreign_key "route_stops", "stops"
  add_foreign_key "schedules", "buses"
  add_foreign_key "schedules", "routes"
  add_foreign_key "seats", "buses"
  add_foreign_key "tickets", "bookings"
  add_foreign_key "tickets", "seats"
end
