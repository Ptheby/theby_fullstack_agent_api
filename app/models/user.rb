class User < ApplicationRecord
    has_secure_password
    validates :email, presence:true, uniqueness: true
    
    # def attributes
    #     super.merge('email' => email)
    #   end
 
   
    has_one :agent
end
