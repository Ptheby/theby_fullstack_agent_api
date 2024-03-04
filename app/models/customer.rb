class Customer < ApplicationRecord
  belongs_to :address
  accepts_nested_attributes_for :address, allow_destroy: true
  belongs_to :agent, optional: true   
  belongs_to :insurance_company, optional: true
end
