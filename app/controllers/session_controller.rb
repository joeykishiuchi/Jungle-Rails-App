class SessionController < ApplicationController

  def new
  end

  def create
    # Checks if user exists and password entered is correct
    user = User.authenticate_with_credentials(user_params[:email], user_params[:password])
    if (user)
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
