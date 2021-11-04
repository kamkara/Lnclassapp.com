class ApplicationController < ActionController::Base
  #setting autorizations with pundit
    include Pundit
    
    protect_from_forgery with: :exception
    #login params
    before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do 
    redirect_to root_url, alert: "vous n'etes pas autorisé à accéder à cette page"
  end

  protected
    # If you have extra params to permit, append them to the sanitizer.
    def configure_permitted_parameters
    sign_up_params          = [ :first_name, :last_name, :full_name, :matricule, :contact, :city, :role,
                              :email, :password, :slug, :gender]
    update_sign_up_params  = [ :school_name, :serie_bac, :status_bac, :avatar_profil, :status_payment]
     
    devise_parameter_sanitizer.permit :sign_up, keys: sign_up_params
      devise_parameter_sanitizer.permit :account_update, keys: update_sign_up_params
      devise_parameter_sanitizer.permit :sign_in, keys: [:logged, :password]
    end 
end
