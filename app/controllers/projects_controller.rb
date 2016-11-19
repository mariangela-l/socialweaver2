class ProjectsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_project, only: [:show, :edit, :update, :destroy]


	def index
		if params[:category].blank? #display all without filtering
			@projects = Project.search(params[:search])
		else
			@category_id = Category.find_by(name: params[:category]).id #FILTER DEPENDS ON WHAT IS THE PARAM
			@projects = Project.where(:category_id => @category_id)
		end
		#@projects = Project.all.order("created_at DESC")
		#@displayed.projects = Project.take(3)
	end

	def show

	end

	def new
		@project = Project.new
		#@projects = current_user.projects.build
		@categories = Category.all.map{ |c| [c.name, c.id]} #when select_tag is created for a dropdown menu in the form partial
															#options_for_select requires an array of arrays, which will be the 
															#text for dropdown (its name) and the value in the db(id attribute)
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id]} 
	end

	def create #building out projects from the current user
		@project = current_user.projects.build(project_params)
		@project.category_id = params[:category_id]

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
		@project.category_id = params[:category_id]
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

	def set_category
 	 @category = Category.includes(:projects).find(params[:id])
	end


	def project_params
		params.require(:project).permit(:title, :summary, :description, :goal, :image_url, :expiration_date, :category_id)
	end

end


