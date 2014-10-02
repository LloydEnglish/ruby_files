class PostsController < ApplicationController

		def index
			@posts = Post.where(user_id: User.find(params[:user_id]))
		end
		
		def show
			@post = Post.find(params[:id])
		end

		def new	
		@posts = Post.new
		end

		def create
			@post = Post.new(params[:user])
			if @post.save
				flash[:notice] = "Post was added"
				redirect_to user_posts_path
			else
				flash[:alert] = "We're sorry but we couldn't add your post"
				redirect_to user_posts_path
			end
		end


end