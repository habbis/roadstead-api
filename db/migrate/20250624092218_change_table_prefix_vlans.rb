class ChangeTablePrefixVlans < ActiveRecord::Migration[8.0]
  def change
    change_column :vlans, :prefix, :cidr, using: "prefix::cidr", null: false
  end
end
