class AddSlugToReservedIp < ActiveRecord::Migration[8.0]
  def change
    add_column :reserved_ips, :slug, :string
    add_index :reserved_ips, :slug, unique: true
  end
end
