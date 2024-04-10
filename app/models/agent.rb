class Agent < ApplicationRecord
  
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :npn, presence:true
  validates :state, presence:true
  validates :phone, presence:true
 
  belongs_to :user
 
  has_many :customers
  has_many :insurance_companies
  
end
