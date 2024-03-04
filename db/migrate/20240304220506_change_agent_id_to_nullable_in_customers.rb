class ChangeAgentIdToNullableInCustomers < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :agent_id, :integer, null: true
  end
end
