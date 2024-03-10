class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # before_action :authenticate_request, except: [:create, :agents_index, :create_agent]   activate later

  def index
    @users = User.all
    render json: UserBlueprint.render(@users)
  end

  def show
    render json: { user: @user, agent: @user&.agent }
  end

  def create_with_agent
    @user = User.new(user_params)
    @agent = @user.build_agent(agent_params)

    if @user.valid? && @agent.valid?
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

  def agents_index
    @agents = Agent.all
    render json: AgentBlueprint.render(@agents)
  end

  def create_agent
    @agent = Agent.new(agent_params)

    if @agent.save
      render json: @agent, status: :created
    else
      render json: { agent_errors: @agent.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id]) || Agent.find_by(id: params[:id])
    render_not_found if @user.nil?
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
   
  def agent_params
    params.require(:agent).permit(:first_name, :last_name, :npn, :state, :city)
  end
end
