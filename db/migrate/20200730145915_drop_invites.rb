class DropInvites < ActiveRecord::Migration[6.0]
  def change
    drop_table :invites
  end
end
