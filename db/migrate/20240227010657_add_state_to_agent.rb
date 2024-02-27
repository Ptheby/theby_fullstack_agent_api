class AddStateToAgent < ActiveRecord::Migration[7.1]
  def change
    add_column :agents, :state, :string
  end
end
