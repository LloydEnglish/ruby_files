class PostsController < ApplicationController
  

  			def index
  				@posts = Post.all
  				@user = User.find(params[:user_id])
  			end

  			def show
  				@post = Post.find(params[:id])
  			end

  			def new
  				@post = Post.new
  				@user = User.where(params[:user_id]).first
  			end

  			def create
  				@post = Post.new(post_params)
			if @post.save
			flash[:notice] = "Post was created"
			else
			flash[:alert] = "Post wasn't created"
			end
			redirect_to user_posts_path 
  			end

  			def destroy
  			@post = Post.find(params[:id])   
             @user = User.where(params[:user_id]).first
             if @post.destroy     
              flash[:notice] = "Post has been removed "   
            else     
              flash[:alert] = "Sorry but this post can't be deleted"   
            end   
              redirect_to user_posts_path
  			end

        def edit
          @posts = Post.find(params[:id])
          @user = User.where(params[:user_id]).first
         end
         
  			def update
  			 @post = Post.find(params[:id])
           		if @post.update(post_params)
          		flash[:notice] = "Post has been renamed"
          	else
          	flash[:alert] = "We're sorry something went wrong"
            end
          	redirect_to user_posts_path
  			end


  private
		
		def post_params
		params.require(:post).permit(:title, :description)
		end
end
