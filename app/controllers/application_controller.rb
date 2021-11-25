class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :not_allowed


    private

    def not_allowed 
        flash[:alert] = "Sorry! You're not allowed to do that!"
        redirect_to(request.referrer || root_path)
    end


    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}

        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password)}
    end
end
