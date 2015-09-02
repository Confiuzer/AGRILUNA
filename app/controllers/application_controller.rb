class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #before_action :check_if_allowed_controller, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  	def configure_permitted_parameters
  	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :second_lat_name)}
  	end

    def check_if_allowed_controller
      if is_allowed?(params[:controller]) != true
        redirect_to root_path
      end
    end

	def is_allowed?(permission)
		if user_signed_in?
			current_user.roles.each do |user_role|
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            user_role.permissions.count = #{user_role.permissions.count}
            !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			  user_role.permissions.each do |user_permission|
          puts "!!!!!!!!!!!!!!!!!!!!!!!!
                user_permission.value = #{user_permission.value}
                permission = #{permission}
                !!!!!!!!!!!!!!!!!!!!!!!!"
			    if user_permission.value == permission
			      return true
			    end
			  end
			end
		else
			return false
			redirect_to root_path
		end
	end

end
