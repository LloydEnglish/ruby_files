class UsersController < ApplicationController

	def index
		@users = User.all
		if @users.present?
			flash[:notice] = "Users display successfully"
		else
			flash[:alert] = "Sorry there were no users to display"
		end
	end

	def show
		@user= User.find(params[:id])
	end

	def destroy   
		@user = User.find(params[:id])   
	if @user.destroy     
		flash[:notice] = "User deleted successfully."   
	else     
		flash[:alert] = "There was a problem deleting the user."  
	end   
	redirect_to home_path 
	end
	
end