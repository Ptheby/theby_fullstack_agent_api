class Customer < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :agent, optional: true

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  accepts_nested_attributes_for :address  # Allow nested attributes for address
end
