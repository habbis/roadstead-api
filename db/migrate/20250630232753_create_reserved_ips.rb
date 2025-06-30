class CreateReservedIps < ActiveRecord::Migration[8.0]
  def change
    create_table :reserved_ips do |t|
      t.string :name
      t.integer :id_hosts
      t.inet :ipv4
      t.inet :ipv6

      t.timestamps
    end
    add_index :reserved_ips, :ipv4, unique: true
    add_index :reserved_ips, :ipv6, unique: true
  end
end
