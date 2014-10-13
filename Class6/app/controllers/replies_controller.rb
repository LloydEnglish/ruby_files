class RepliesController < ApplicationController

      def index
        @replies = Reply.all
        @user = User.where(params[:user_id]).first
      end

      def show
         @reply = Reply.find(params[:id])
         @topic = Topic.where(params[:topic_id]).first
         @user = User.where(params[:user_id]).first
      end

      def new
        @user = User.where(params[:user_id]).first
        @topic = Topic.where(params[:topic_id]).first
        @reply = Reply.new
      end

      def create
        @reply = Reply.new

        if @reply.save(reply_params)
        flash[:notice] = "Your reply went through"     
        redirect_to user_reply_path @reply   
        else     
        flash[:alert] = "Problem with your reply"    
        redirect_to user_replies_path   
        end

      end

      def update
        @reply = Reply.find(params[:id])

      if @reply.update(reply_params)
      flash[:notice] = "Your reply has been changed"
      else
      flash[:alert] = "We're sorry something went wrong"
      end
      redirect_to user_reply_path
      end

      def edit
        @reply = Reply.find(params[:id])
        @topic = Topic.where(params[:topic_id]).first
        @user = User.where(params[:user_id]).first
      end

      def destroy
          @reply = Reply.find(params[:id])   
          @user = User.where(params[:user_id]).first
             
             if @reply.destroy     
              flash[:notice] = "Reply delete was a success "   
            else     
              flash[:alert] = "Reply wan't remove, try again later"   
            end   
              redirect_to user_reply_path @user
      end

      private

        def reply_params
          params.require(:reply).permit(:body)
        end
end
