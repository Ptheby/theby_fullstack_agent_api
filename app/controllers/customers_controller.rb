class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all
  end

  # GET /customers/:id
  def show
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
    @address = @customer.build_address(address_params)
  
    if @customer.valid? && @address.valid?
      @customer.save
      @address.save
      render json: { customer: @customer, address: @address }, status: :created
    else
      render json: { customer_errors: @customer.errors, address_errors: @address.errors }, status: :unprocessable_entity
    end
  end



  # POST /customers
  # def create
  #   @customer = Customer.new(customer_params)

  #   if @customer.save
  #     redirect_to @customer, notice: 'Customer was successfully created.'
  #   else
  #     puts @customer.errors.full_messages
  #     render :new
  #   end
  # end

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