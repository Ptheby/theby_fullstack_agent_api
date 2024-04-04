
class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :update, :destroy]

  # GET /agents
  def index
    @agents = Agent.all
    render json: @agents
  end

  # GET /agents/:id
  def show
    render json: @agent
  end

  # POST /agents
  def create
    @agent = Agent.new(agent_params)

    if @agent.save
      render json: @agent, status: :created
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /agents/:id
  def update
    if @agent.update(agent_params)
      render json: @agent
    else
      render json: @agent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /agents/:id
  def destroy
    @agent.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def agent_params
      params.require(:agent).permit(:first_name, :last_name, :npn, :state, :user_id)
    end
end
