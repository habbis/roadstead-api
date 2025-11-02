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

ActiveRecord::Schema[8.0].define(version: 2025_10_28_224910) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "group_vars", force: :cascade do |t|
    t.bigint "hostgroup_id"
    t.string "keyname"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_group_vars_on_slug", unique: true
  end

  create_table "host2hostgroups", force: :cascade do |t|
    t.bigint "host_id"
    t.bigint "id_hostgroup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "host_vars", force: :cascade do |t|
    t.integer "host_id"
    t.string "keyname"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_host_vars_on_slug", unique: true
  end

  create_table "hostgroups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "group_var_id", null: false
    t.index ["group_var_id"], name: "index_hostgroups_on_group_var_id"
    t.index ["name"], name: "index_hostgroups_on_name", unique: true
    t.index ["slug"], name: "index_hostgroups_on_slug", unique: true
  end

  create_table "hosts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_hosts_on_name", unique: true
    t.index ["slug"], name: "index_hosts_on_slug", unique: true
  end

  create_table "interfaces", force: :cascade do |t|
    t.string "name"
    t.bigint "host_id"
    t.bigint "vlan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ipams", force: :cascade do |t|
    t.string "name"
    t.inet "ipv4"
    t.inet "ipv6"
    t.bigint "interface_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["ipv4"], name: "index_reserved_ips_on_ipv4", unique: true
    t.index ["ipv6"], name: "index_reserved_ips_on_ipv6", unique: true
    t.index ["slug"], name: "index_reserved_ips_on_slug", unique: true
  end

  create_table "vlans", force: :cascade do |t|
    t.string "name"
    t.string "cluster"
    t.integer "vlanid"
    t.cidr "prefix", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_vlans_on_name", unique: true
    t.index ["prefix"], name: "index_vlans_on_prefix", unique: true
    t.index ["slug"], name: "index_vlans_on_slug", unique: true
  end

end
