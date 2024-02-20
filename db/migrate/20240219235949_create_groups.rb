class CreateGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :groups do |t|
      t.string :city
      t.string :state
    
      t.string :description,null:true

      t.timestamps
    end
  end
end
