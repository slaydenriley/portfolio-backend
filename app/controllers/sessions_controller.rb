class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      login!
      render json: {
        logged_in: true,
        user: current_user,
        admin: current_user.admin
      }
    else
      render json: {
        status: 401,
        logged_in: false,
        admin: false,
        errors: ['Cannot find user, please try again']
      }
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user,
        admin: current_user.admin
      }
    else
      render json: {
        logged_in: false,
        message: 'Not Logged In'
      }
    end
  end

  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end

private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
