class SessionsController < ApplicationController
 def new   
 end
  #processes data from login form   
  def create      
  	@user = User.where(username: params[:username]).first      
  	if @user 
    session[:user_id] = @user.id
    flash[:notice] = "You've logged in successfully"
       redirect_to session_path @user
       elsif !@user 
       	 flash[:alert] = "Sorry this user doesn't exist"
       redirect_to sessions_path 
       else
       	  flash[:alert] = "Come back soon"
   		end
	end

   def destroy  
   session[:user_id] = nil 
   flash[:notice] = "You've successfully logged out " 
   redirect_to root_path   
	end        
   	  
   

end