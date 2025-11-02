class ChangeTableHosts < ActiveRecord::Migration[8.0]
  def change
    change_column :hosts, :hostgroups_id, :bigint, null: true
    change_column :hosts, :host_vars_id, :bigint, null: true
    change_column :hosts, :interface_id, :bigint, null: true
  end
end
