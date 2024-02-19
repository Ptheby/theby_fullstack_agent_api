FactoryBot.define do
  factory :address do
    street_number { 1 }
    street_name { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { 1 }
  end
end
