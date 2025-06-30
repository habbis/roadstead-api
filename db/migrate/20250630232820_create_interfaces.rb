class CreateInterfaces < ActiveRecord::Migration[8.0]
  def change
    create_table :interfaces do |t|
      t.string :name
      t.inet :ipv4
      t.inet :ipv6
      t.integer :id_hosts
      t.integer :id_vlan
      t.integer :id_reserved_ip

      t.timestamps
    end
    add_index :interfaces, :ipv4, unique: true
    add_index :interfaces, :ipv6, unique: true
  end
end
