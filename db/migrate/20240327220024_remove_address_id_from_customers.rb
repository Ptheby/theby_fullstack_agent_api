class RemoveAddressIdFromCustomers < ActiveRecord::Migration[7.1]
  def change
    remove_column :customers, :address_id
  end
end
