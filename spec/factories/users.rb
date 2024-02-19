FactoryBot.define do
  factory :user do
    email {"paul@theby.com"}
    role {"admin"}
    password_digest {"password_hash"}
  end
end
