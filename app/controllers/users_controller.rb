class UsersController < ApplicationController
  
  skip_before_action :authorize, only: :create
    # before_action :authorize, only: :show

    # @current_user ||= User.find(session[:user_id])

  #sign up new
  def create
    user = User.create!(user_params)
    # if user.valid?
      session[:user_id] = user.id
      render json: user, status: :created
    # else
    #   render json: { error: user.errors.full_messages }, status: :unprocessable_entity
    # end
  end
  
  #stay logged after refrsh
    def show
      # user = User.find_by(id: session[:user_id])
      render json: User.find(session[:user_id])
    end
  
    private
  
    def authorize
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    end

    #say this need a password_confimation
    def user_params
        params.permit(:username, :password_digest, :image_url, :bio)
    end

end
