class AddSlugToHosts < ActiveRecord::Migration[8.0]
  def change
    add_column :hosts, :slug, :string
    add_index :hosts, :slug, unique: true
  end
end
