class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_request

  # GET /customers
  def index
    @customers = Customer.all
    render json: {customers: @customers}, status: :created
  end

  # GET /customers/:id
  def show
    @customer = Customer.find(params[:id])
  render json: @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @customer.build_address  # Build associated address for the customer
  end

  # GET /customers/:id/edit
  def edit
  end

  def create_with_address
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: { customer: @customer }, status: :created
    else
      render json: { customer_errors: @customer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/:id
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /customers/:id
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(
        :first_name, :last_name, :email, :phone, :dob, :agent_id,
        address_attributes: [:street_number, :street_name, :city, :state, :zip]
      )
    end
end
