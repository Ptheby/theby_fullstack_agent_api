class Address < ApplicationRecord
    belongs_to :customer
    # validates :customer_id, presence: true
    validates :street_number, :street_name, :city, :state, :zip, presence: true
  end
  