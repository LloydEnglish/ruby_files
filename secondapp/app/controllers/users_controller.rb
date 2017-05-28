class UsersController < ApplicationController

layout 'layout2'
		
		def index
			@users = User.all
		
	if @users.present?    
	flash[:notice] = "Users display successfully."   
	else
    flash[:alert] = "Sorry, there were no users to display."
  	end
	
		end

		def show
		@user = User.find(params[:id])
		end 
end