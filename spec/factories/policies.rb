FactoryBot.define do
  factory :policy do
    type { "" }
    exp_date { "2024-02-18" }
    term_length { 1 }
    customer { nil }
    agent { nil }
    insurance_company { nil }
  end
end
