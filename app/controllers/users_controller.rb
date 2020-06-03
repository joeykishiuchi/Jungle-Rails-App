class UsersController < ApplicationController

  def new 
  end

  def create
    user = User.new(user_params)
    # user credentials must pass validations before saving
    if (user.save)
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if users sign up credentials don't meet validation, send them back to sign up page
      redirect_to '/signup'
    end
  end

  private 
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )
    end
end
