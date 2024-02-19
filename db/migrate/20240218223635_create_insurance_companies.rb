class CreateInsuranceCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :insurance_companies do |t|
      t.string :name
      t.references :agent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
