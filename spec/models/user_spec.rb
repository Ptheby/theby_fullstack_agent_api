require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validation Tests" do

    it 'is valid with a username and password' do
      user = build(:user)
      expect(user).to be_valid
    end




    it "is not valid without a valid email address" do 
      user = User.new(password_digest: "password_hash")
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("is invalid")
    end

  

    it "is not valid without a password_digest" do 
      user = User.new( email: "user@example.com")
      expect(user).to_not be_valid
      expect(user.errors[:password_digest]).to include("can't be blank")
    end
  end
end