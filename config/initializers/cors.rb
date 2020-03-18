# Rails.application.config.middleware.insert_before 0, Rack::Cors do
# 	allow do
# 		origins '*'
# 		resource '*', headers: :any, methods: [:get, :post, :put, :patch, :options, :head]
# 	end

# 	# allow do
# 	# 	origins "http://localhost:3000/"
# 	# 	resource "*", headers: :any, methods: [:get, :post, :put, :patch, :options, :head],
# 	# 	credentials: true
# 	# end

# 	# allow do
# 	# 	origins "https://247848ef.ngrok.io/"
# 	# 	resource "*", headers: :any, methods: [:get, :post, :put, :patch, :options, :head],
# 	# 	credentials: true
# 	# end
# end