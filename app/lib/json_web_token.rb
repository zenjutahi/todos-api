class JsonWebToken 
  # secret to encode and decode token 
  ZMAC_SECRET = Rails.application.secrets.secret_key_base
  
  def self.encode(payload, exp = 24.hours.from.now)
    # set expiry to 24 hours from creation time
    payload[:exp] = exp.to_i
    # sign token with appliction secret
    JWT.encode(payload, ZMAC_SECRET)
  end
  
  def self.decode(token)
    # get payload; first index in decoded array
    body = JWT.decode(token, ZMAC_SECRET)[0]
    HashWishIndifferentAccess.new body
    # rescue from all decode errors
  rescue JWT::DecodeError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, e.message
  end
end