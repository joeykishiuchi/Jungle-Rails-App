class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(user_params[:email])
    # Checks if user exists and password entered is correct
    if (user && user.authenticate(user_params[:password]))
      session[:user_id] = user.id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
