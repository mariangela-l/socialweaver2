class ProjectsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_project, only: [:show, :edit, :update, :destroy]


	def index
		@projects = Project.search(params[:search])
		#@displayed.projects = Project.take(4)
	end

	def show

	end

	def new
		@project = Project.new
	end

	def edit
	end

	def create
		@project = current_user.projects.build(project_params)

		respond_to do |format|
			if @project.save
				format.html { redirect_to @project, notice: "Project was succesfully created."}
				format.json { render :show, status: :ok, location: @project }
			else
				format.html { render :new }
				format.json { render json: @project.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @project.update(project_params)
				format.html { redirect_to @project, notice: "Project was succesfully updated."}
				format.json { render :show, status: :ok, location: @project }
			else
				format.html { render :edit }
				format.json { render json: @project.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@project.destroy
		respond_to do |format|
			format.html { redirect_to root_path, notice: "Project was succesfully removed."}
			format.json { head :no_content }
		end
	end

private


	def set_project
		@project = Project.find(params[:id])
	end

	def project_params
		params.require(:project).permit(:title, :summary, :description, :goal, :image_url, :expiration_date, :category_id)
	end

end


