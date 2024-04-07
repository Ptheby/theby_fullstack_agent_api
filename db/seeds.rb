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
    npn: Faker::Number.unique.number(digits: 8),
    phone: Faker::PhoneNumber.cell_phone,
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
    agent_id: Agent.pluck(:id).sample,
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
10.times do
  Policy.create!(
    policy_type: ["Auto", "Home", "Life"].sample,
    exp_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    term_length: Faker::Number.between(from: 1, to: 10),
    customer: [customer1, customer2].sample,
    agent: [agent1, agent2].sample,
    insurance_company: [insurance_company1, insurance_company2].sample,
    premium_amount: Faker::Number.decimal(l_digits: 4, r_digits: 2),
    policy_file: Faker::Lorem.word + ".pdf"
  )
end
