class AddHostgroupToHost < ActiveRecord::Migration[8.0]
  def change
    add_reference :hosts, :hostgroups, null: false, foreign_key: true
  end
end
