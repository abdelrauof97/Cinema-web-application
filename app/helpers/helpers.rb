module Helpers 
  
  def login(user)
    session[:user_id] = user.id
  end

  def logout!
    session[:user_id] = nil
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= Customer.where(id: session[:user_id]).first
    end
  end
  
end