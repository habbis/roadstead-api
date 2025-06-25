class AddSlugToVlans < ActiveRecord::Migration[8.0]
  def change
    add_column :vlans, :slug, :string
    add_index :vlans, :slug, unique: true
  end
end
