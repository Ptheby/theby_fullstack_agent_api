class RemoveGroupIdFromAgents < ActiveRecord::Migration[7.1]
  def change
    remove_column :agents, :group_id, :integer
  end
end
