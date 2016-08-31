class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  ROLES = {0 => 'guest', 1 => 'user', 2 => 'helper', 3 => 'planner'}
  
  attr_reader :role
    
  def current_role
    if current_user && @event.user == current_user
      @role = ROLES[3]
    elsif current_user && @event.user != current_user
      @role = ROLES[2]
    elsif current_user
      @role = ROLES[1]
    else
      @role = ROLES[0]
    end
    p @role
  end
  helper_method :current_role
end
