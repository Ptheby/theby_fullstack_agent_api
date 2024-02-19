FactoryBot.define do
  factory :customer do
    first_name { "MyString" }
    last_name { "MyString" }
    phone { 1 }
    dob { "2024-02-18" }
    email { "MyString" }
    address { nil }
    agent { nil }
    insurance_company { nil }
  end
end
