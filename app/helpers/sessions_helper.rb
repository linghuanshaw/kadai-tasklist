module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  
  # def current_user?
  #   if current_user.id == params[:id]
  #     return true
  #   else
  #     return false
  #   end
  # end
  
end