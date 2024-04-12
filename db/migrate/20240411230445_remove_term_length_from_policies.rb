class RemoveTermLengthFromPolicies < ActiveRecord::Migration[7.1]
  def change
    remove_column :policies, :termlength
   change_column :policies, :term_length, :string
  end
end
