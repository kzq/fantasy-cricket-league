class LeaguesController < ApplicationController
  def index
    leagues = League.all
    render json: leagues, status: 200     
  end
end