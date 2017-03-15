class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
  end

  private
  
  attr_reader :headers
  
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(token)
  end

  def token
    header_present? ? http_auth_header : nil
  end

  def http_auth_header
    headers['Authorization'].split(' ').last
  end
  
  def header_present?
    headers['Authorization'].present?
  end
  
end