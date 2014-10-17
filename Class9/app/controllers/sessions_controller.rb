class SessionsController < ApplicationController

	def new
	end

	def create

		@user = User.find_by(email: params[:email])

			if @user && @user.authenticate(params[:password])
			flash[:notice] = "You've been logged in."
			session[:user_id] = @user.id
			redirect_to user_path @user

			else
			flash[:alert] = "There was a problem logging you in."
			redirect_to log_in_path
			end

 		 end

  		def destroy
  
  			session[:user_id] = nil
			flash[:notice] = "You've been logged out successfully."
			redirect_to "/"

  			end

end