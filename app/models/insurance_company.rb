class InsuranceCompany < ApplicationRecord
  validates :name, presence:true
  belongs_to :agent
  has_many :customers
  has_many :polices
  has_many :agents
end
