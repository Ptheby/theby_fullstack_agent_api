class AgentsController < ApplicationController
    before_action :set_agent, only: [:show, :edit, :update, :destroy]
  
    def index
      @agents = Agent.all
      render json: @agents
    end
  
    def show
      render json: @agent
    end
  
    def new
      @agent = Agent.new
      render json: @agent
    end
  
    def create
      @agent = Agent.new(agent_params)
  
      if @agent.save
        render json: @agent, status: :created, location: @agent
      else
        render json: @agent.errors, status: :unprocessable_entity
      end
    end
  
    def edit
      # No HTML response for edit
      head :not_found
    end
  
    def update
      if @agent.update(agent_params)
        render json: @agent
      else
        render json: @agent.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @agent.destroy
      head :no_content
    end
  
    private
  
    def set_agent
     @agent = Agent.find(params[:id])
    end
  
    def agent_params
      params.require(:agent).permit(:first_name,:last_name,:email,:npn,:user_id,:group_id)
    end
  end
end
