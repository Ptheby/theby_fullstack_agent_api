class User < ApplicationRecord
    has_secure_password
    validates :email, presence:true, uniqueness: true,format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password_digest, presence: true
    # def attributes
    #     super.merge('email' => email)
    #   end
 
    # accepts_nested_attributes_for :agent
    has_one :agent
end
