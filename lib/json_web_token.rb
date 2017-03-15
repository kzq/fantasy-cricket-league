class JsonWebToken
  class << self
    # By default token expires in 1 day
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      { errors: ['Not Authenticated'] , status: :unauthorized }
    end
  end
end