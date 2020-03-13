class Api::PostsController < ApplicationController

	before_action :set_post, only: [:show, :update, :destroy]

	def index
		@posts = Post.all
		render json: @posts
	end
	
	def create
		params["post"] = {name: params["name"], description: params["description"]}
		@post = Post.new(post_params)

		if @post.save
			render json: { status: true }, status: :ok
		else
			render json: { status: false }, status: :error
		end
	end

	def show
		if @post
			render json: @post, status: :ok
		else
			render json: { status: false }, status: :unauthorized
		end
	end

	def update
		params["post"] = {name: params["name"], description: params["description"]}
		if @post.update(post_params)
			render json: { status: true }, status: :ok
		else
			render json: { status: false }, status: :ok
		end
	end

	def destroy
		if @post.destroy
			render json: { status: true }, status: :ok
		else
			render json: { status: false }, status: :ok
		end
	end

	private

	def post_params
		params.require(:post).permit(:name, :description)
	end

	def set_post
		@post = Post.find_by(id: params[:id])
	end
end