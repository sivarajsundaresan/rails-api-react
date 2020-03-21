class Api::PostsController < ApplicationController

	before_action :set_user, only: [:index, :create]
	before_action :set_post, only: [:show, :update, :destroy]

	def index
		@posts = @user.posts.all
		render json: @posts
	end

	
	def create
		@post = @user.posts.new(post_params)

		if @post.save
			render json: @post, status: :created
		else
			render json: @post.errors, status: :error
		end
	end

	def show
		if @post
			render json: @post, status: :ok
		else
			render json: @post.errors, status: :unauthorized
		end
	end

	def update
		if @post.update(post_params)
			render json: @post, status: :updated
		else
			render json: @post.errors, status: :unauthorized
		end
	end

	def destroy
		if @post.destroy
			render json: { status: true }, status: :ok
		else
			render json: { status: false }, status: :unauthorized
		end
	end

	private

	def post_params
		params.require(:post).permit(:name, :description)
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def set_user
		@user = User.find(params[:id])
	end
end