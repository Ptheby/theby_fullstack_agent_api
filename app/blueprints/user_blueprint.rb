class UserBlueprint < Blueprinter::Base
  identifier :id
  # field :email

  view :default do
    field :email
    association :agent, blueprint: AgentBlueprint, view: :default
  end


