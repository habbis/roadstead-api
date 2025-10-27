class RenameColumName < ActiveRecord::Migration[8.0]
  def change
    rename_column :group_vars, :id_hostgroup, :hostgroup_id
    rename_column :host2hostgroups, :id_hosts, :hosts_id
    rename_column :host_vars, :id_hosts, :hosts_id
    rename_column :interfaces, :id_hosts, :hosts_id
    rename_column :interfaces, :id_vlan, :vlan_id
    rename_column :ipams, :id_hosts, :hosts_id
    rename_column :vlans, :vlan_id, :vlanid
  end
end
