class UsersController < ApplicationController
  def create
    users = User.all
    render json: users, status: 200
  end
end
