class Api::V1::PlayersController < ApplicationController
  # GET /palayers
  def index
    players =Player.all
    render json: players, status: :ok    
  end
  
  #POST /players
  def create
    player = Player.new(player_params)
    if player.save
      render json: player, status: :created 
    else 
      render json: player.errors, status: :unprocessable_entity 
    end    
  end
  
  private
  
  def player_params
    #params.require(:player).permit(:league_id,:name,:country)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only:[:league,:name,:country])
  end
  
end
