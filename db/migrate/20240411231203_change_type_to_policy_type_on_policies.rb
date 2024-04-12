class ChangeTypeToPolicyTypeOnPolicies < ActiveRecord::Migration[7.1]
  def change
    rename_column :policies, :type, :policy_type
  end
end
