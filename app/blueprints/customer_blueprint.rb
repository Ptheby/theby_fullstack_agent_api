# frozen_string_literal: true

class CustomerBlueprint < Blueprinter::Base

   
        identifier :id
        # field :email
      
        view :default do
          fields :first_name,:last_name,:phone,:dob,:email,:agent_id,:address_attributes
          association :agent, blueprint: AgentBlueprint
         
        end
      
      

end
