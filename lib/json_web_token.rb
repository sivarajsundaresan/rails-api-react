class JsonWebToken
	class << self

		def encode(payload, exp=24.hour.from_now)
			payload[:exp] = exp.to_i
			JWT.encode(payload, Rails.application.secrets.secret_key_base)
		end

		def decode(token)
			body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
			p "..............body_user_id................"
			@curent_user_id = body["user_id"]
			HashWithIndifferentAccess.new body
		rescue
			nil
		end
	end
end