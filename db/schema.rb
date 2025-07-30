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

ActiveRecord::Schema[8.0].define(version: 2025_07_30_115316) do
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
    t.integer "id_hosts"
    t.string "keyname"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_group_vars_on_slug", unique: true
  end

  create_table "host2hostgroups", force: :cascade do |t|
    t.integer "id_hosts"
    t.integer "id_hostgroup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "host_vars", force: :cascade do |t|
    t.integer "id_hosts"
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
    t.string "FQDN"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.bigint "hostgroups_id", null: false
    t.bigint "host_vars_id", null: false
    t.bigint "interface_id", null: false
    t.index ["FQDN"], name: "index_hosts_on_FQDN", unique: true
    t.index ["host_vars_id"], name: "index_hosts_on_host_vars_id"
    t.index ["hostgroups_id"], name: "index_hosts_on_hostgroups_id"
    t.index ["interface_id"], name: "index_hosts_on_interface_id"
    t.index ["slug"], name: "index_hosts_on_slug", unique: true
  end

  create_table "interfaces", force: :cascade do |t|
    t.string "name"
    t.inet "ipv4"
    t.inet "ipv6"
    t.integer "id_hosts"
    t.integer "id_vlan"
    t.integer "id_reserved_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ipv4"], name: "index_interfaces_on_ipv4", unique: true
    t.index ["ipv6"], name: "index_interfaces_on_ipv6", unique: true
  end

  create_table "reserved_ips", force: :cascade do |t|
    t.string "name"
    t.integer "id_hosts"
    t.inet "ipv4"
    t.inet "ipv6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["ipv4"], name: "index_reserved_ips_on_ipv4", unique: true
    t.index ["ipv6"], name: "index_reserved_ips_on_ipv6", unique: true
    t.index ["slug"], name: "index_reserved_ips_on_slug", unique: true
  end

  create_table "vlans", force: :cascade do |t|
    t.string "name"
    t.integer "vlan_id"
    t.cidr "prefix", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["name"], name: "index_vlans_on_name", unique: true
    t.index ["prefix"], name: "index_vlans_on_prefix", unique: true
    t.index ["slug"], name: "index_vlans_on_slug", unique: true
  end

  add_foreign_key "hostgroups", "group_vars"
  add_foreign_key "hosts", "host_vars", column: "host_vars_id"
  add_foreign_key "hosts", "hostgroups", column: "hostgroups_id"
  add_foreign_key "hosts", "interfaces"
end
