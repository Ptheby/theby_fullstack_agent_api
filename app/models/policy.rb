class Policy < ApplicationRecord
  validates :policy_type, presence: true
  validates :term_length, presence:true
  validates :premium_amount, presence:true
  validates :exp_date, presence:true


  belongs_to :customer
  belongs_to :agent
  belongs_to :insurance_company
end
