class ChangeNpnToStringInAgents < ActiveRecord::Migration[7.1]
  def change
    change_column :agents, :npn, :string
  end
end
