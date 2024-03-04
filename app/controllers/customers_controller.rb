class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]
  # before_action :authenticate_request     activate this later!

  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    render json: { customer: @customer }
  end

  # def create
  #   # Extract address_attributes without customer_id
  

  #   @customer = Customer.new(customer_params)
  #   address_attributes = params[:customer].delete(:address_attributes)

  #   # Build the address using the modified address_attributes
  #   new_address = @customer.build_address(address_attributes)

  #   if @customer.valid?
  #     @customer.save
  #     render json: { customer: @customer }, status: :created
  #   else
  #     render json: { customer_errors: @customer.errors }, status: :unprocessable_entity
  #   end
  # end

  def create
    # Permit all customer attributes, including address_attributes
    @customer = Customer.new(customer_params)
  
    if @customer.save
      render json: { customer: @customer }, status: :created
    else
      render json: { customer_errors: @customer.errors }, status: :unprocessable_entity
    end
  end



  def update
    updated_address_attributes = params[:customer][:address_attributes]
    existing_address = @customer.addresses.first_or_initialize
    existing_address.update(updated_address_attributes)

    if @customer.update(customer_params)
      render json: { customer: @customer }
    else
      render json: { customer_errors: @customer.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @customer.destroy
    head :no_content
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(
      :first_name,
      :last_name,
      :phone,
      :dob,
      :email,
      address_attributes: [:street_number, :street_name, :city, :state, :zip],
      :agent_id=>[],
      :insurance_company_id=>[]
    )
  end
end