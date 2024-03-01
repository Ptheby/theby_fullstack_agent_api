class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: { user: @user, agent: @user.agent }
  end

  def create_with_agent
    # initializes user (does not save yet)
    @user = User.new(user_params)
    # stores user_id in agent
    @agent = @user.build_agent(agent_params)

    if @user.valid? && @agent.valid?
      # save user and agent
      @user.save 
      @agent.save
      render json: { user: @user, agent: @agent }, status: :created
    else
      render json: { user_errors: @user.errors, agent_errors: @agent.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params) && @user.agent.update(agent_params)
      render json: { user: @user, agent: @user.agent }
    else
      render json: { user_errors: @user.errors, agent_errors: @user.agent.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password,:password_confirmation)
  end
   
  def agent_params
    params.require(:agent).permit(:first_name, :last_name, :email, :npn, :state)
  end
end


