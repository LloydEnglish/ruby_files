class PostsController < ApplicationController

layout 'layout1'

		def index
		@posts = Post.all
		end

		def show
		@post = Post.find(params[:id])
		end

end
