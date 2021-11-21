class ApplicationController < ActionController::Base

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :not_allowed

    private

    def not_allowed 
        flash[:alert] = "Sorry! You're not allowed to do that!"
        redirect_to(request.referrer || root_path)
    end

end
