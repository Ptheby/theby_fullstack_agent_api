class User < ApplicationRecord
    validates :email, presence:true, email:true
    validates :role, presence:true,inclusion: { in: %w(admin user), message: "%{value} is not a valid role" }
    validates :password_digest, presence:true
 
   
    has_one :agent
end
