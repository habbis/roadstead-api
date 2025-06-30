class CreateHost2hostgroups < ActiveRecord::Migration[8.0]
  def change
    create_table :host2hostgroups do |t|
      t.integer :id_hosts
      t.integer :id_hostgroup

      t.timestamps
    end
  end
end
