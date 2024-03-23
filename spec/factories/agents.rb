FactoryBot.define do
  factory :agent do
    first_name { "MyString" }
    last_name { "MyString" }
    npn { 1 }
    user { nil }
    state {"MyString"}
  end
end
