class DropGroupMembership < ActiveRecord::Migration[7.1]
  def change
    drop_table:group_memberships
  end
end
