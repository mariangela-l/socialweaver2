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
	  @pledges =current_user.pledges.build
		#@pledge = @project.find(params[:project_id])
		#@pledge = @project.pledges.new
		respond_to do |format|
			format.html
		end
	end
	
	def create  

	 @pledge = current_user.pledges.build(create_pledge_params)
	  respond_to do |format|
	    if @project.user != current_user &&
	    	current_user == Project.find(@project)
		        	flash.now[:error] = "Pledge is invalid"
	        	format.html {render :new }
	        		format.json { render json: @pledge.errors, status: :unprocessable_entity }
	        	
	        	else
		        	@pledge.save
					#current_user.update(project_id: result.pledge.id)
		          	format.html { redirect_to project_pledge_path(@pledge), notice: "Your pledge was successfully created." }
		        	format.json { render :show, status: :ok, location: @pledge }
 
	        		
	      end     
	    end
	end



	private

	def create_pledge_params
		params.require(:pledge).permit(:amount, :user_id, :project_id, :expiration_date, :status)
	end

	def set_pledges
		@pledges = @project.pledges
	end

	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_amount
		@amount = Pledge.find(params[:amount].to_i)
	end


end
