class ApplicationController < ActionController::Base

helper_method :current_user, :admin?

def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def require_login
  redirect_to login_path unless current_user
end

def admin?
  current_user&.role == "admin"
end

def require_admin
  unless admin?
    redirect_to root_path, alert: "Access denied"
  end
end


end
