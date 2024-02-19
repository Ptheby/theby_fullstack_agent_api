class InsuranceCompany < ApplicationRecord
  validates :name, presence:true
  belongs_to :agent
end
