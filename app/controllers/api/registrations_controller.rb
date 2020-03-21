class Api::RegistrationsController < ApplicationController
	skip_before_action :authenticate_request

	def create
		p params
		user = User.create(email: params['user']['email'], password: params['user']['password'], password_confirmation: params['user']['password_confirmation'])
		if user.id.present?
			render json: {
				status: :created,
				user: user
			}
		else
			render json: { status: 500 }
		end
	end
end