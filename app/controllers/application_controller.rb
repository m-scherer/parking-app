class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def bad_request
    render json: { error: 'not acceptable' }.to_json, status: 406
  end

end
