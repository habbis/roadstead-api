class CreateVlans < ActiveRecord::Migration[8.0]
  def change
    create_table :vlans do |t|
      t.string :name
      t.integer :vlan_id
      t.string :prefix

      t.timestamps
    end
    add_index :vlans, :name, unique: true
    add_index :vlans, :prefix, unique: true
  end
end
