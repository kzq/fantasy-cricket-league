class Api::V1::PlayersController < ApplicationController
  # GET /palayers
  def index
    players =Player.page(params[:page] ? params[:page][:number] : 1)
    render json: players, meta: pagination_meta(players), status: :ok    
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
  
  def pagination_meta(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.previous_page,
      total_pages: object.total_pages,
      total_count: object.total_entries
    }
  end
  
  def player_params
    #params.require(:player).permit(:league_id,:name,:country)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only:[:league,:name,:country])
  end
  
end
