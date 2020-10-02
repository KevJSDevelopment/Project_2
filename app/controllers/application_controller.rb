class ApplicationController < ActionController::Base

  def current_user
    session[:name]
  end


end
