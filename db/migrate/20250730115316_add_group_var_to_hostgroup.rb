class AddGroupVarToHostgroup < ActiveRecord::Migration[8.0]
  def change
    add_reference :hostgroups, :group_var, null: false, foreign_key: true
  end
end
