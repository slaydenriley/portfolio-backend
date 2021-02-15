class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      payload = {
        user: current_user,
        logged_in: true,
        admin: current_user.admin
      }
      render :json => payload
    else
      payload = {
        error: "Something went wrong. Please try again.",
        status: 400
      }
      render :json => payload, :status => :bad_request
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: UserSerializer.new(user).to_serialized_json
  end

  def index
    users = User.all
    render json: UserSerializer.new(users).to_serialized_json
  end

  def update
    user = User.find_by(id: user_params[:id])
    binding.pry
    if user.update(user_params)
      users = User.all
      render json: UserSerializer.new(users).to_serialized_json
    else
      payload = {
        error: "Something went wrong. Please try again.",
        status: 400
      }
      render :json => payload, :status => :bad_request
    end
  end

  def destroy
    user = User.find_by(id: user_params[:id])
    if user.destroy
      users = User.all
      render json: UserSerializer.new(users).to_serialized_json
    else
      payload = {
        error: "Something went wrong. Please try again.",
        status: 400
      }
      render :json => payload, :status => :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :id,
      :name,
      :email,
      :description,
      :password,
      :password_confirmation,
      :admin
    )
  end
end
