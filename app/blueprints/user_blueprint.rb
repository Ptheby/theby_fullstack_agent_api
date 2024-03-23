class UserBlueprint < Blueprinter::Base
  identifier :id

  view :default do
    fields :email, :id
  end

  view :extended do
    include_view :default # Include fields from the default view
    fields :created_at, :updated_at
    association :agent, blueprint: AgentBlueprint
  end
end

