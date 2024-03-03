class Address < ApplicationRecord
    validates :street_number , presence:true, numericality:true
    validates :street_name, presence:true
    validates :city, presence:true
    validates :state, presence:true
    validates :zip, presence:true, numericality:true
    has_one :customer
end
