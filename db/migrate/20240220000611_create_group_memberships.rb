class CreateGroupMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :group_memberships do |t|
      t.string :group_memberships
      t.integer :agent_id
      t.integer :group_id

      t.timestamps
    end
    add_index :group_memberships, [:agent_id], unique: true
  end

end
