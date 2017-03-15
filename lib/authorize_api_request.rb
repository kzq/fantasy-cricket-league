class AuthorizeApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def authenticate_request!
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  private
  
  attr_reader :headers
  
  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  

  def http_auth_header
    if headers['Authorization'].present?
      return {token: headers['Authorization'].split(' ').last }
    else
      return 'Missing token'
    end
    nil
  end
end