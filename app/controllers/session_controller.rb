class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # Checks if user exists and password entered is correct
    if (user && user.authenticate(params[:password]))
      session[:user_id] = user.user_id
      redirect_to '/'
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to '/login/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login/new'
  end

end
