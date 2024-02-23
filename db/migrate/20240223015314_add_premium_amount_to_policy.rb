class AddPremiumAmountToPolicy < ActiveRecord::Migration[7.1]
  def change
    add_column :policies, :premium_amount, :decimal
  end
end
