# Lighthouse Backend
Lighthouse is the backend of the Lighthouse project. The frontend of which can be found here

[https://github.com/Ptheby/theby_agent_fe]

Lighthouse was conceived to provide local insurance agents with a solution for retaining customers facing cancellation or non-renewal. Often, these situations arise due to factors such as excessive claims of a certain type or no longer aligning with a particular insurer's risk appetite. In such cases, customers are left to seek alternative coverage by approaching different carriers, a process that can be time-consuming and uncertain.

With the customer's consent, the referring agent can share pertinent details, enabling the receiving agent to assess suitability before engaging directly. This approach minimizes the need for extensive conversations and email exchanges between agents, facilitating a smoother and more efficient resolution.

Moreover, Lighthouse operates on a reciprocal basis, fostering a collaborative environment among agents. For every customer entered into the system, agents earn credits that can be redeemed to assist other customers in similar situations. This incentivizes agents to proactively engage with at-risk customers, ensuring they remain within the agency's network and fostering goodwill among agents.

In essence, Lighthouse not only helps retain potentially lost customers but also fosters cooperation among agents, ultimately benefiting both customers and agents alike.

# Features
Controllers to add and delete the following

Users- for auth/login
Agents- created with user as the agent profile for a user
Customers- can belong to an agent
Addresses- belongs to customers
Policies -belongs to agents/customers
Insurance Companies


# Testing
Has tests for most of the controllers and features. Initate them by typing

bundle exec rspec
#Installation
Fork this repository.
Clone your repository to your local environment.
Run the following to install all required dependencies.
bundle install
Change the environments provided to your specific development or production environments.
Generate a master key
Usage
rails db:migrate
rails db:seed
rails s
Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

License
GNU GPLv3
