class PagesController < ApplicationController
  #make sure users are logged in
before_action :authenticate_user!, only: [:account]	
  def home
  	if current_user
  		redirect_to account_path
  	end
  end

  def about
  end

  def account
    #fetches all the projects that bellow to a current owner
   	@projects=current_user.projects
  end

end


