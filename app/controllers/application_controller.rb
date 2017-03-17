class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user
  
  private

  def authenticate_request
    api_request = AuthorizeApiRequest.new(request.headers)
    @current_user = api_request.authenticate_request! 
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized unless @current_user
  end
  
  # The resource must have a non emty #errors object
  def render_error(resource, status)
    render json: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer  
  end
end
