class Api::StaticController < ApplicationController
	def home
		render json: { status: "Api working"}
	end
end