
class AgentsController < ApplicationController
    def index
      @agents = Agent.all
      render json: AgentBlueprint.render(@agents)
    end
  end













#

 


# class AgentsController < ApplicationController
#     before_action :set_user
#     before_action :set_agent, only: [:show, :update, :destroy]
  
#     def index
#       @agents = @user.agents
#       render json: @agents
#     end
  
#     def show
#       render json: @agent
#     end
  
#     def create
#       @agent = @user.agents.build(agent_params)
  
#       if @agent.save
#         render json: @agent, status: :created
#       else
#         render json: @agent.errors, status: :unprocessable_entity
#       end
#     end
  
#     def update
#       if @agent.update(agent_params)
#         render json: @agent
#       else
#         render json: @agent.errors, status: :unprocessable_entity
#       end
#     end
  
#     def destroy
#       @agent.destroy
#       head :no_content
#     end
  
#     private
  
#     def set_user
#       @user = User.find(params[:user_id])
#     end
  
#     def set_agent
#       @agent = @user.agents.find(params[:id])
#     end
  
   
#     def agent_params
#       params.permit(:first_name,:last_name,:email,:npn,:user_id)
#     end
#   end

