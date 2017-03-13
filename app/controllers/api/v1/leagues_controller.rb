class Api::V1::LeaguesController < ApplicationController
  def index
    leagues = League.all
    render json: leagues, status: 200     
  end
end