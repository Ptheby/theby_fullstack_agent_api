class CreatePolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :policies do |t|
      t.string :type
      t.date :exp_date
      t.integer :term_length
      t.references :customer, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.references :insurance_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
