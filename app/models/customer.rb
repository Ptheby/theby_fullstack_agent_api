class Customer < ApplicationRecord
  has_one :address, dependent: :destroy
  belongs_to :agent

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates_associated :address
  validates_presence_of :address

  accepts_nested_attributes_for :address, allow_destroy: true
end

