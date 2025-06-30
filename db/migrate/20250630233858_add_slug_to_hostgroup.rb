class AddSlugToHostgroup < ActiveRecord::Migration[8.0]
  def change
    add_column :hostgroups, :slug, :string
    add_index :hostgroups, :slug, unique: true
  end
end
