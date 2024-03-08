class Agent < ApplicationRecord
  validates :email, presence:true, email:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :npn, presence:true, numericality:true
  validates :state, presence:true
 
  belongs_to :user
 
  has_many :customers
  has_many :insurance_companies
  
end
