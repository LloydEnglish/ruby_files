class TopicsController < ApplicationController
          
          def index
            @topics = Topic.all
          end

          def new
            @topic = Topic.new
          end

          def create
            @topic = Topic.new
          end

          def show
            @topic = Topic.find(params[:id])
          end

          def update
          @topic = Topic.find(params[:id])
         if @topic.update(topic_params)
          flash[:notice] = "Topic has been renamed"
          else
          flash[:alert] = "We're sorry something went wrong"
          end
          redirect_to root_path
          end

          def edit
            @topic = Topic.find(params[:id])
          end

          def destroy
              @topic = Topic.find(params[:id])   
        if @topic.destroy     
       flash[:notice] = "Topic has been removed "   
        else     
        flash[:alert] = "Sorry but this topic can't be deleted"   
        end   
        redirect_to root_path
        end
        
end
