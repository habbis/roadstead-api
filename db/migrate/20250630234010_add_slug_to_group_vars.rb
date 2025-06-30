class AddSlugToGroupVars < ActiveRecord::Migration[8.0]
  def change
    add_column :group_vars, :slug, :string
    add_index :group_vars, :slug, unique: true
  end
end
