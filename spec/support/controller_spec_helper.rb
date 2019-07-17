module ControllerSpecHelper
  # generate token from user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end
  
  # generate expired tokens from user id
  def expired_token_generator(user_id)
    JsonWebToken.encode( { user_id: user_id }, (Time.now.to_i - 10))
  end
  
  # returns valid headers
  def valid_headers
    {
      "Authorization" => token_generator(user_id),
      "content-Type" => "application/json"
    }
  end
  
  # returns invalid headers
  def invalid_headers
    {
      "Authorization" => nil,
      "content-Type" => "application/json" 
    }   
  end
end