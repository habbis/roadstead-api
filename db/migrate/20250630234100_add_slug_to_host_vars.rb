class AddSlugToHostVars < ActiveRecord::Migration[8.0]
  def change
    add_column :host_vars, :slug, :string
    add_index :host_vars, :slug, unique: true
  end
end
