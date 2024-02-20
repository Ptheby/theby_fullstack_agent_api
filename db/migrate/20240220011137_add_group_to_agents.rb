class AddGroupToAgents < ActiveRecord::Migration[7.1]
  def change
    add_reference :agents, :group,  foreign_key: true
  end
end
