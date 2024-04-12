class ChangeTermlengthTypeInPolicy < ActiveRecord::Migration[6.0]
  def change
    change_column :policies, :termlength, :string
  end
end
