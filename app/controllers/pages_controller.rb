class PagesController < ApplicationController
before_action :authenticate_user!, only: [:account]	
  def home
  end

  def about
  end

  def account
  	@projects=current_user.projects
  end

end


