class AddressesController < ApplicationController
    before_action :set_customer
    before_action :set_address, only: [:show, :edit, :update, :destroy]
  
    # GET /customers/:customer_id/addresses
    def index
      @addresses = @customer.addresses
    end
  
    # GET /customers/:customer_id/addresses/:id
    def show
      @address = Address.find(params[:id])
    end
  
    # GET /customers/:customer_id/addresses/new
    def new
      @address = @customer.addresses.build
    end
  
    # GET /customers/:customer_id/addresses/:id/edit
    def edit
    end
  
    # POST /customers/:customer_id/addresses
    def create
      @address = @customer.addresses.build(address_params)
  
      if @address.save
        redirect_to customer_address_path(@customer, @address), notice: 'Address was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /customers/:customer_id/addresses/:id
    def update
      if @address.update(address_params)
        redirect_to customer_address_path(@customer, @address), notice: 'Address was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /customers/:customer_id/addresses/:id
    def destroy
      @address.destroy
      redirect_to customer_addresses_path(@customer), notice: 'Address was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_customer
        @customer = Customer.find(params[:customer_id])
      end
  
      def set_address
        @address = @customer.addresses.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def address_params
        params.require(:address).permit(:street_number, :street_name, :city, :state, :zip)
      end
  end
  