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

ActiveRecord::Schema.define(version: 20160404174845) do

  create_table "news", force: :cascade do |t|
    t.string   "titulo",      limit: 255
    t.text     "descripcion", limit: 65535
    t.text     "iframe",      limit: 65535
    t.string   "categoria",   limit: 255
    t.date     "publicar"
    t.boolean  "visible"
    t.string   "usuario",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "noticia", force: :cascade do |t|
    t.string   "titulo",      limit: 255
    t.text     "descripcion", limit: 65535
    t.text     "iframe",      limit: 65535
    t.string   "categoria",   limit: 255
    t.date     "publicar"
    t.boolean  "visible"
    t.string   "usuario",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "programas", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.text     "imagen",      limit: 65535
    t.text     "url",         limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "ups", force: :cascade do |t|
    t.string   "usuario",    limit: 255
    t.string   "adjunto",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
