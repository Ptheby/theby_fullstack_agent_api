class Customer < ApplicationRecord
has_one :address
  accepts_nested_attributes_for :address, allow_destroy: true
  belongs_to :agent, optional: true   
 

  validates :email, presence:true, email:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  
end