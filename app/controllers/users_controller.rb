class UsersController < ApplicationController
  def create
    unless params[:password] == params[:password_confirmation]
      return render json: {errors: ["passwords must match"]}, status: :unprocessable_entity
    end

    user = User.create(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: params[:image_url],
      bio: params[:bio]
    )
    session[:user_id] = user.id

    render json: user, status: :created
  end

  def show
    user = User.find_by(id: session[:user_id])

    if user
      render json: user
    else
      render json: { errors: ["🔒"] }, status: :unauthorized
    end
  end
end
