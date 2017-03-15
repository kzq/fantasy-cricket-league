class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created  
    else  
      render_error(user, :unprocessable_entity) 
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :surname)
  end
    
end
