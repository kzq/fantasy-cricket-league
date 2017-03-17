class Api::V1::LeaguesController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]
  
  # GET /leagues 
  def index
    leagues = League.all
    render json: leagues, status: 200     
  end
  
  #POSt /leagues
  def create
    league = League.new(league_params)
    if league.save
      render json: league, status: :created
    else
      render json: league.errors, status: :unprocessable_entity
    end      
  end
  
  # GET /leagues/:id
  def show
    league = League.find()  
  end  
  
  # PUT /leagues/:id
  def update
    
  end
  
  # DELETE /leagues/:id
  def destroy
    
  end
  
  private
  
  def league_params
    params.require(:league).permit(:name, :country, :description)
  end
  
end