class PoliciesController < ApplicationController
    before_action :set_policy, only: [:show, :update, :destroy]
    before_action :authenticate_request
  
    def index
      @policies = Policy.all
    end
  
    def show
    end
  
  def create
    @agent = @current_user.agent
    @policy = Policy.new(policy_params)
    @policy.agent = @agent
    if @policy.save
      render json: { policy: @policy }, status: :created
    else
      render json: { policy_errors: @policy.errors.full_messages }, status: :unprocessable_entity
    end
  end
    
  
  
    def update
      if @policy.update(policy_params)
        redirect_to @policy, notice: 'Policy was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @policy.destroy
      redirect_to policies_url, notice: 'Policy was successfully destroyed.'
    end
  
    private
      def set_policy
        @policy = Policy.find(params[:id])
      end
  
      def policy_params
        params.require(:policy).permit(:policy_type, :exp_date, :term_length, :premium_amount, :policy_file)
      end
  end
  