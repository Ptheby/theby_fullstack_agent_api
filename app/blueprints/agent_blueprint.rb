class AgentBlueprint < Blueprinter::Base
  identifier :id
  fields :first_name, :last_name, :npn, :state, :city

  association :user, blueprint: UserBlueprint, view: :default
  
end