Knock.setup do |config|
  config.token_lifetime = 1.day
  config.token_signature_algorithm = 'HS256'
  config.token_secret_signature_key = -> { JWT.base64url_decode ENV['TOKEN_SECRET'] }
  config.not_found_exception_class_name = 'ActiveRecord::RecordNotFound'
end
