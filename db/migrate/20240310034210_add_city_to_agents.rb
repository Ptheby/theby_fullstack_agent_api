class AddCityToAgents < ActiveRecord::Migration[7.1]
  def change
    add_column :agents, :city, :string
  end
end
