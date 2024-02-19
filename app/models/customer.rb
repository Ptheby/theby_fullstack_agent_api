class Customer < ApplicationRecord
  belongs_to :address
  belongs_to :agent
  belongs_to :insurance_company
end
