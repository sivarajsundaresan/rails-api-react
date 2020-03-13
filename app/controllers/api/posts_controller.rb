class Api::PostsController < ApplicationController

	def index
		@posts = Post.all
		render json: @posts
	end
	
	def create
		params["post"] = {name: "post3", description: "description3"}
		@post = Post.new(post_params)

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

	private

	def post_params
		params.require(:post).permit(:name, :description)
	end
end