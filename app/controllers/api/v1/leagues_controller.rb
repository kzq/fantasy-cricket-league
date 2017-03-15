class Api::V1::LeaguesController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]
  
  def index
    leagues = League.all
    render json: leagues, status: 200     
  end
end