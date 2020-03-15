class Api::StaticController < ApplicationController
	def home
		render json: { status: "Api static working"}
	end
end