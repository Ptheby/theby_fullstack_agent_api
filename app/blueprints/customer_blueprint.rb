# frozen_string_literal: true

class CustomerBlueprint < Blueprinter::Base

   
        identifier :id
        # field :email
      
        view :default do
          fields :first_name,:last_name,:phone,:dob,:email,:agent_id
          association :agent, blueprint: AgentBlueprint
          association :address, blueprint: AddressBlueprint         
        end
      
      

end
