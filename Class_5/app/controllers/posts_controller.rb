class PostsController < ApplicationController

		def index
			@posts = Post.all
			
		end
		
		def show
			@post = Post.find(params[:id])

		end

		def new	
			@posts = Post.new
			@user = User.where(params[:user_id]).first
		end

		def create
			@post = Post.new(post_params)

			if current_user
				@post.user_id = current_user.id

					if @post.save
						flash[:notice] = "Post was added"
						redirect_to user_posts_path
			        end
			else
					flash[:alert] = "We're sorry but we couldn't add your post"
					redirect_to user_posts_path
			end
		end

		def edit
			@posts = Post.find(params[:id])
			@user = User.where(params[:user_id]).first
		end

		def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "Your post has been modified"
		else
			flash[:alert] = "Something went wrong. Try again later"
		end
		redirect_to user_posts_path
		end

		def destroy
			@post = Post.find(params[:id])   
			if @post.destroy     
			flash[:notice] = "This post was successfully removed "   
			else     
			flash[:alert] = "We can't remove this post"   
			end   
		redirect_to user_posts_path
			end


		private
	def post_params
		params.require(:post).permit(:title,:body)
	end
end