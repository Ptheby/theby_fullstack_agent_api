class Policy < ApplicationRecord
  belongs_to :customer
  belongs_to :agent
  belongs_to :insurance_company
end
