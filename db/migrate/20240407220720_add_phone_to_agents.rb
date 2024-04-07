class AddPhoneToAgents < ActiveRecord::Migration[7.1]
  def change
    add_column :agents, :phone, :string
  end
end
