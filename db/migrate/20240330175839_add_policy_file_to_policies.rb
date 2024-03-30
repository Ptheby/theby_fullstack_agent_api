class AddPolicyFileToPolicies < ActiveRecord::Migration[7.1]
  def change
    add_column :policies, :policy_file, :string
  end
end
