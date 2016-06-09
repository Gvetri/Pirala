class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_locale
  def new_session_path(scope)
    new_user_session_path
  end


  def set_locale

    I18n.locale = params[:locale] || I18n.default_locale
  end

end
