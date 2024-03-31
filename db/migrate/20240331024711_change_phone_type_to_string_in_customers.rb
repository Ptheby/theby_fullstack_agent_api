class ChangePhoneTypeToStringInCustomers < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :phone, :string
  end
end
