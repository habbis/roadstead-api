class AddHostVarsToHost < ActiveRecord::Migration[8.0]
  def change
    add_reference :hosts, :host_vars, null: false, foreign_key: true
  end
end
