class ApplicationController < ActionController::API
 before_action :authentication_request

 def authentication_request
 	@current_user = AuthorizeApiRequest.call(request.headers).result
 	render json: { error: 'Not Authorized' }, status: 401 unless @current_user
 end
end
