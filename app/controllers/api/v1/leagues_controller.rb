class Api::V1::LeaguesController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]
  before_action :set_league, only: [:show, :update, :destroy] 
  
  # GET /leagues 
  def index
    leagues = League.all
    render json: leagues, status: 200     
  end
  
  #POST /leagues
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
    render json: @league, status: :ok   
  end  
  
  # PUT /leagues/:id
  def update
    if @league.update_attributes(league_params)
      render json: @league, status: :ok  
    else
      render_error(@league, :unprocessable_entity)    
    end 
  end
  
  # DELETE /leagues/:id
  def destroy
    @league.destroy
    head :no_content  
  end
  
  private
  
  def league_params
    params.require(:league).permit(:name, :country, :description)
  end
  
  def set_league
    begin
      @league = League.find(params[:id])
    rescue ActiveRecord::RecordNorFound
      league = League.new
      league.errors.add(:id, "Wrong ID provided")
      render_error(league, :not_found) and return
    end      
  end
  
end