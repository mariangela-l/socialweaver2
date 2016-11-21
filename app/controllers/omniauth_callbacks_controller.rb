class OmniauthCallbacksController < Devise ::OmniauthCallbacksController
	def all
		user = User.from_omniauth(request.env['omniauth.auth']) #method into user model
			if @user.persisted?
				sign_in and redirect_to @user :event => authentication
			else
				session["devise.user_attributes"]=user.attributes
				redirect_to new_user_registration_url
	end
	alias_method :facebook, :all
end
