class ChangeTermlengthTypeInPolicy < ActiveRecord::Migration[6.0]
  def change
    change_column :policies, :term_length, :string
  end
end
