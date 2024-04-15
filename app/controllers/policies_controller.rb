class PoliciesController < ApplicationController
  before_action :set_policy, only: [:show, :update, :destroy]
  before_action :authenticate_request


  
    def index
      @policies = Policy.all
      render json: @policies
    end
  
    def show
      render json: @policy
    end
  
    def create
      @agent = @current_user.agent
      @policy = Policy.new(policy_params)
      @policy.agent = @agent
      @policy.customer_id = params[:customer_id] # Set the customer_id from the route
      if @policy.save
        render json: { policy: @policy }, status: :created
      else
        render json: { policy_errors: @policy.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if @policy.update(policy_params)
        render json: { policy: @policy }
      else
        render json: { policy_errors: @policy.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @policy.destroy
      render json: { message: 'Policy was successfully destroyed.' }
    end
  
    private
  
    def set_policy
      @policy = Policy.find(params[:id])
    end
  
    def policy_params
      params.require(:policy).permit(:policy_type, :exp_date, :term_length, :premium_amount, :policy_file, :insurance_company_id, :customer_id)
    end
  end
  