# frozen_string_literal: true

class CustomerBlueprint < Blueprinter::Base

   
        identifier :id
        # field :email
      
        view :default do
          # fields :first_name,:last_name,:phone,:dob,:email,:agent_id
          # association :agent, blueprint: AgentBlueprint, view: :default
          # association :user, blueprint: UserBlueprint, view: :default
        end
      
      

end
