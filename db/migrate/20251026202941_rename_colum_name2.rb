class RenameColumName2 < ActiveRecord::Migration[8.0]
  def change
    rename_column :host2hostgroups, :hosts_id, :host_id
    rename_column :host_vars, :hosts_id, :host_id
    rename_column :interfaces, :hosts_id, :host_id
    rename_column :ipams, :hosts_id, :host_id
  end
end
