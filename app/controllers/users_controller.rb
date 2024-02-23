class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
  
    def index
      @users = User.all
      render json: @users
    end
  
    def show
      render json: @user
    end
  
    def new
      @user = User.new
      render json: @user
    end
  

      def create
        # Step 1: Create a new user with email and password
        @user = User.new(user_params)
    
        if @user.save
          # Step 2: After saving the user, create associated agent profile
          @agent = @user.build_agent(agent_params)
          
          if @agent.save
            render json: { user: @user, agent: @agent }, status: :created
          else
            render json: { errors: @agent.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
private
  
  
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      head :no_content
    end
  
  
  
    def set_user
      @user = User.find(params[:id])
    end
  
     
    def user_params
      params.permit(:email, :password)
    end
  
    def agent_params
      params.permit(:first_name, :last_name, :email, :npn)
    end
  end