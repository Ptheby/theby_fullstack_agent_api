class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customers = Customer.all
    render json: CustomerBlueprint.render(@customers, view: :default)
  end

  def show
    render json: CustomerBlueprint.render(@customer, view: :default)
  end

  def create
    @customer = Customer.new(customer_params)
  
    begin
      if @customer.save
        render json: CustomerBlueprint.render(@customer, view: :default), status: :created
      else
        render json: { customer_errors: @customer.errors }, status: :unprocessable_entity
      end
    rescue ActiveRecord::InvalidForeignKey => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def update
    if @customer.update(customer_params)
      render json: CustomerBlueprint.render(@customer, view: :default)
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
      :agent_id,
      :insurance_company_id,
      address_attributes: [:street_number, :street_name, :city, :state, :zip]
    )
  end
end