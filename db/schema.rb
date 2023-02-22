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

ActiveRecord::Schema[7.0].define(version: 2023_02_21_234627) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "phones", force: :cascade do |t|
    t.integer "id_especificaciones"
    t.integer "user_id"
    t.float "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaccions", force: :cascade do |t|
    t.integer "id_comprador"
    t.integer "id_vendedor"
    t.integer "telefono_id"
    t.string "status"
    t.float "ganancia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "permisos_vender", default: true
    t.boolean "permisos_comprar"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "phones", "users"
  add_foreign_key "transaccions", "phones", column: "id_vendedor"
  add_foreign_key "transaccions", "phones", column: "telefono_id"
  add_foreign_key "transaccions", "users", column: "id_comprador"
end