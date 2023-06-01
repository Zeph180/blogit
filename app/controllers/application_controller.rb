class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session
end
