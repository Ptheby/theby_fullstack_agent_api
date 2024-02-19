require 'rails_helper'

RSpec.describe Agent, type: :model do
  context "Validation Tests" do
    it "is not valid without a first name" do 
      
      agent = Agent.new(last_name:"Paul",email:"email@gmail.com", npn:12345678, user_id: 123)
      expect(agent).to_not be_valid
      expect(agent.errors[:first_name]).to include("can't be blank")
    end
 
    it "is not valid without a last name" do 
      
      agent = Agent.new(first_name: "Cletus",email:"email@gmail.com", npn:12345678, user_id: 123)
      expect(agent).to_not be_valid
      expect(agent.errors[:last_name]).to include("can't be blank")
    end

    it "is not valid without a valid email" do 
      
      agent = Agent.new(first_name: "Cletus",last_name:"Paul",email:"invalid_email", npn:12345678, user_id: 123)
      expect(agent).to_not be_valid
      expect(agent.errors[:email]).to include("is invalid")
    end

    it "is not valid without a user_id" do 
      
      agent = Agent.new(first_name: "Cletus",last_name:"Paul",email:"email@gmail.com", npn:12345678)
      expect(agent).to_not be_valid
      expect(agent.errors[:user_id]).to include("can't be blank")

    end  
    it "is not valid without a npn" do 
      
      agent = Agent.new(first_name: "Cletus",last_name:"Paul",email:"invalid_email", user_id:123)
      expect(agent).to_not be_valid
      expect(agent.errors[:npn]).to include("can't be blank")
    end
    it "npn must be a number" do 
      
      agent = Agent.new(first_name: "Cletus",last_name:"Paul",email:"invalid_email",npn: "hello", user_id:123)
      expect(agent).to_not be_valid
      expect(agent.errors[:npn]).to include("is not a number")
    end
  end
end