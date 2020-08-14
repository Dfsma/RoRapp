class ApplicationController < ActionController::Base
    before_action :configure_devise_params, if: :devise_controller?
    #before_action :authenticate_user!, except: [:index, :show]
    
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, alert:"No tienes Permisos, intenta iniciar sesión"
    end
    
    protected
    def configure_devise_params
        devise_parameter_sanitizer.permit(:sign_up) do |user|
            user.permit(:name, :email, :password, :password_confirmation)
        end
    end
    
    def authenticate_user!
        if user_signed_in?
            super
        else
            redirect_to new_user_session_path if request.original_fullpath != new_user_session_path
        end
    end
end
