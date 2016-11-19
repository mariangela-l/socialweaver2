class PledgesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_project


	#project owner ability to see how many people pledges for a project created
	def index
		@pledges = @project.pledges
		respond_to do |format| 
		format.html
		end
	end

	def new
		@pledges = @project.pledges.build
		#@pledge = current_user.pledges.build(pledge_params)
		#@pledge = @project.find(params[:project_id])
		@pledge = @project.pledges.new
	end



	private

	def pledge_params
		params.require(:pledge).permit(:amount, :user_id, :project_id, :expiration_date, :status)
	end

	def set_pledges
		@pledges = @project.pledges
	end

	def set_project
		@project = Project.find(params[:project_id])
	end


end
