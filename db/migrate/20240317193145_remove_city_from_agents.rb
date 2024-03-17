class RemoveCityFromAgents < ActiveRecord::Migration[7.1]
  def change
    remove_column :agents, :city, :string
  end
end
