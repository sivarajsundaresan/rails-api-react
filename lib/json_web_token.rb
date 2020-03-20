class JsonWebToken
	class << self

		def encode(payload, exp=24.hour.from_now)
			payload[:exp] = exp.to_i
			JWT.encode(payload, Rails.application.secrets.secret_key_base)
		end

		def decode(token)
			p "token"
			p token
			p Rails.application.secrets.secret_key_base
			p JWT.decode(token, Rails.application.secrets.secret_key_base)
			p 'jwt..............'
			body = JWT.decode(token, Rails.application.secrets.secret_key_base)
			p "body"
			p body
			body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
			p body
			HashWithIndifferentAccess.new body
		rescue
			nil
		end
	end
end