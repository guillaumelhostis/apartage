class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "Accès non autorisé"
    redirect_to(root_path)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :role])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:image])
  end

# Après s'être connecté, si le User n'a pas rempli le formulaire il n'accède pas à la search ou a son dashboard

  def after_sign_in_path_for(resource)
    if current_user.role == "senior"
      stored_location_for(resource) || pages_senior_dashboard_path
    elsif current_user.role == "junior"
      stored_location_for(resource) || pages_junior_dashboard_path  # changer en junior dashboard
    end
  end
end
