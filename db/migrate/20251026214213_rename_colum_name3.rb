class RenameColumName3 < ActiveRecord::Migration[8.0]
  def change
    rename_column :interfaces, :id_reserved_ip, :ipam_id
  end
end
