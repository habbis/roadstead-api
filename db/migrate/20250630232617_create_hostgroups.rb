class CreateHostgroups < ActiveRecord::Migration[8.0]
  def change
    create_table :hostgroups do |t|
      t.string :name

      t.timestamps
    end
    add_index :hostgroups, :name, unique: true
  end
end
