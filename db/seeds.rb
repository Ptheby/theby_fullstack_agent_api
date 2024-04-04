# db/seeds.rb

require 'faker'

# Seed users
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password', # Set a default password for seeded users
    created_at: Faker::Time.between(from: DateTime.now - 1.year, to: DateTime.now)
  )
end

# Seed agents with valid user_id references
10.times do
  Agent.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    npn: Faker::Number.unique.number(digits: 6),
    user_id: User.pluck(:id).sample,
    state: Faker::Address.state,
    created_at: Faker::Time.between(from: DateTime.now - 1.year, to: DateTime.now)
  )
end

# Seed insurance companies with valid agent_id references
10.times do
  InsuranceCompany.create!(
    name: Faker::Company.name,
    agent_id: Agent.pluck(:id).sample,
    created_at: Faker::Time.between(from: DateTime.now - 1.year, to: DateTime.now)
  )
end
10.times do
  customer = Customer.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.cell_phone,
    dob: Faker::Date.birthday(min_age: 18, max_age: 90),
    email: Faker::Internet.email,
    agent_id: Faker::Id.agent_id,
    insurance_company_id: InsuranceCompany.pluck(:id).sample,
    created_at: Faker::Time.between(from: DateTime.now - 1.year, to: DateTime.now)
  )

  # Build associated address for the customer
  customer.build_address(
    street_number: Faker::Address.building_number,
    street_name: Faker::Address.street_name,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip: Faker::Address.zip_code
  ).save!
end
