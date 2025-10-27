class AddInterfaceseToIpams < ActiveRecord::Migration[8.0]
  def change
    add_reference :ipams, :interface, null: true, foreign_key: true
  end
end
