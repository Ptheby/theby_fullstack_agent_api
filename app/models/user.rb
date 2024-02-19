class User < ApplicationRecord
    validates :email, presence:true, email:true
    validates :role, presence:true
    validates :password_digest, presence:true
end
