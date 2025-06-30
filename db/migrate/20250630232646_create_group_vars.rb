class CreateGroupVars < ActiveRecord::Migration[8.0]
  def change
    create_table :group_vars do |t|
      t.integer :id_hosts
      t.string :keyname
      t.text :value

      t.timestamps
    end
  end
end
