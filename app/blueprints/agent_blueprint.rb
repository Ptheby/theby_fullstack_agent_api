class AgentBlueprint < Blueprinter::Base
  identifier :id
  view :default do
  
  fields :first_name, :last_name, :npn, :state, :phone

  end
end