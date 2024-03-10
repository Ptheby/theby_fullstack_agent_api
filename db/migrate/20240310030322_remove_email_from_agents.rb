class RemoveEmailFromAgents < ActiveRecord::Migration[7.1]
  def change
    remove_column :agents, :email, :string
  end
end
