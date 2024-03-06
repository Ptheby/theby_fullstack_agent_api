class RemoveCustomerReferenceFromAddresses < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :addresses, :customers
  end
end
