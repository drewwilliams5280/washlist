class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_list, :current_list?

  def current_list
    @current_list ||= List.find(session[:list_id]) if session[:list_id]
  end

  def current_list?
    if current_list
      return true
    else
      render file: "/public/401"
    end
  end
end
