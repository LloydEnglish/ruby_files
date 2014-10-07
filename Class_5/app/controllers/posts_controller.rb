class PostsController < ApplicationController

		def index
			@posts = Post.all
			# since posts are nested under users you will need to get the posts for a user
			# @posts = Post.where(user_id: params[:user_id])
		end
		
		def show
			@post = Post.find(params[:id])
			# same comment as above, the post needs to be away of the user it belongs to
		end

		def new	
			@user = User.where(params[:user_id]).first
			@post = Post.new 
			# same comment as above, the post needs to be away of the user it belongs to
			# @post = @user.posts.new
			
		end

		def create
			@post = Post.new(post_params)
			# @user = User.where(params[:user_id]).first
			#  @post = @user.posts.create

			if current_user # this works as well, but it would be better to create the post through teh user association
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
			# same comment as above, the post needs to be away of the user it belongs to
			@posts = Post.find(params[:id])
			@user = User.where(params[:user_id]).first
		end

		def update
			# same comment as above, the post needs to be away of the user it belongs to
			@post = Post.find(params[:id])
			if @post.update(post_params)
				flash[:notice] = "Your post has been modified"
			else
				flash[:alert] = "Something went wrong. Try again later"
			end
			redirect_to user_posts_path
		end

		def destroy
			# same comment as above, the post needs to be away of the user it belongs to
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
