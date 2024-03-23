
class AddressBlueprint < Blueprinter::Base

   
    identifier :id
    # field :email
  
    view :default do
      fields   :street_number,:street_name, :city, :state, :zip
    
      association :customer, blueprint: CustomerBlueprint
     
    end
  
  

end
