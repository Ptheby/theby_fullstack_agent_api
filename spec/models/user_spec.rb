require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validation Tests" do
    it "is not valid without a valid email address" do 
      user = User.new(password_digest: "password_hash", role: "admin", email: "invalid_email")
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("is invalid")
    end

    it "is not valid without a role assigned" do 
      user = User.new(password_digest: "password_hash", email: "user@example.com")
      expect(user).to_not be_valid
      expect(user.errors[:role]).to include("can't be blank")
    end

    it "is not valid without a password_digest" do 
      user = User.new(role: "admin", email: "user@example.com")
      expect(user).to_not be_valid
      expect(user.errors[:password_digest]).to include("can't be blank")
    end
  end
end