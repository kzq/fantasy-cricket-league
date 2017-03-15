class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only: [:authenticate_user]
  
  def authenticate_user
    email, password = params[:email], params[:password] 
    user = User.find_by_email(email)
    if user && user.authenticate(password)    
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user && user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id})
    }
  end
  
  private
  
  def user_params
    params.permit(:email, :password)
  end 
  
end