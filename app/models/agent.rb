class Agent < ApplicationRecord
  validates :email, presence:true, email:true
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :npn, presence:true, numericality:true
  validates :user_id, presence:true, numericality:true
  belongs_to :user
  belongs_to :group, optional:true
  has_many :customers
  has_many :insurance_companies
  
end
