class JsonWebToken
  def self.encode(payload)
  	p payload
  	p Rails.application.secrets.secret_key_base
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.credentials.secret_key_base)[0])
  rescue
    nil
  end
end