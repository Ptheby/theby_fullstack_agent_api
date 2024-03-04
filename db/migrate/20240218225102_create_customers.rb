class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.date :dob
      t.string :email
      t.references :address, null: false, foreign_key: true
      t.references :agent, null: false, foreign_key: true
      t.references :insurance_company, null: false, foreign_key: true

      t.timestamps
      
      # add_column :customers, :agent_id, :integer, default: 0

    end
  end
end
