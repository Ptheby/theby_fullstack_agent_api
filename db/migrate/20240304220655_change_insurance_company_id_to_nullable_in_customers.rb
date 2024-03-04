class ChangeInsuranceCompanyIdToNullableInCustomers < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :insurance_company_id, :integer, null: true
  end
end
