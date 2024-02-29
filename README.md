# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Describe the API and how it relates to the overall full stack project. Include the purpose, target audience and scope.
    The purpose of my API is to house the database and database methods/code in creating users,agents,customers,policies, and a few other insurance related models. The API has the database for these models and also the actions within to CRUD them in the controllers. The target audience for the application itself is insurance agents. The scope includes the agents details, customer details and customer's policies details. 



Describe the API's architecture, including the main aspects of your application and how it interactions with your front end as well including authentication and authorization.
   Main aspect is first creating a user/agent together in a one to one relationship;they are one in the same. User info is used for auth and login and agent and user info is used for signup. This is done on the front end and it passes that information from the front end reactive angular forms to the backend to actually be created. This is the same for entering customer and policy information. Authentication and authorization is done on the backend and the front end with token infomation passing back and forth


Describe the setup instructions to start the project.



Refer to the set of gems utilized in the project other than the default added gems. 
 Bcrypt for password encyption and the utilization of password_digest; has_secure_password. 
 



Describe testing made in your API.
  I tested the first few models with success withn RSPEC. I then tested some of the controller/user and auth with Postman. 


Please include the url to your Front end Project's repository
https://github.com/Ptheby/theby_fullstack_agent_api
