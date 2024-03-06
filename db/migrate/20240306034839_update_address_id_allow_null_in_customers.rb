class UpdateAddressIdAllowNullInCustomers < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :address_id, :integer, null: true
  end
end
