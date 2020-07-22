class ApplicationController < ActionController::Base
    before_action :configure_devise_params, if: :devise_controller?
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, alert:"No tienes Permisos"
    end
    
    protected
    def configure_devise_params
        devise_parameter_sanitizer.permit(:sign_up) do |user|
            user.permit(:name, :email, :password, :password_confirmation)
        end
    end
end
