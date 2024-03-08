class UserBlueprint < Blueprinter::Base
  identifier :id
  # field :email

  view :default do
    field :email
   
  end
end


