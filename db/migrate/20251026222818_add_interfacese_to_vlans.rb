class AddInterfaceseToVlans < ActiveRecord::Migration[8.0]
  def change
    add_reference :vlans, :interface, null: true, foreign_key: true
  end
end
