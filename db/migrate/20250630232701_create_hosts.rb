class CreateHosts < ActiveRecord::Migration[8.0]
  def change
    create_table :hosts do |t|
      t.string :FQDN

      t.timestamps
    end
    add_index :hosts, :FQDN, unique: true
  end
end
