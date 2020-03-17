Rails.application.config.middleware.insert_before 0, Rack::Cors do
	allow do
		origins "https://rails-backend-api-react.herokuapp.com/"
		resource "*", headers: :any, methods: [:get, :post, :put, :patch, :options, :head],
		credentials: true
	end
end