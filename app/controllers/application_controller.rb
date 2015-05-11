class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!
  before_filter :is_authenticated_user

  def is_authenticated_user
    if current_user.nil?
      redirect_to new_user_session_path
    end
  end
end
