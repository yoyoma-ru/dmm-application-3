class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resorce)
		resource = current_user.id
		user_path(resource)
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	protected
	def configure_permitted_parameters
		added_attrs = [:user_name, :email, :password, :password_confirmation]
		devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
	end
end
