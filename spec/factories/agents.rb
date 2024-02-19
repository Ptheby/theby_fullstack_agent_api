FactoryBot.define do
  factory :agent do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    npn { 1 }
    user { nil }
  end
end
