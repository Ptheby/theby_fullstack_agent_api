class User < ApplicationRecord
    has_secure_password
    validates :email, presence:true, email:true
    validates :role, presence:true,inclusion: { in: %w(admin user agent), message: "%{value} is not a valid role" }

 
   
    has_one :agent
end
