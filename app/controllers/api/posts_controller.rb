class Api::PostsController < ApplicationController

	def index
		@posts = Post.all
		render json: @posts
	end
	
	def create
		@post = Post.new(params)

		if @post.save
			render json: { status: true }, status: :ok
		else
			render json: { status: false }, status: :error
		end
	end

	def update

	end

	def destroy
	end
end