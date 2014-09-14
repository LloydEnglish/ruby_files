class BirdsController < ApplicationController

  def new
  @bird = Bird.new
	end

  def create
  @bird = Bird.new(birds_params)
  @bird.save
  redirect_to @bird
  end

	def update
      @bird = Bird.find(birds_params)

      if @bird.update(birds_params)
        redirect_to @bird
      else
        render 'edit'
      end
      end

    def edit
      @bird = Bird.find(params[:id])
      end

    def show
  		@bird = Bird.find(params[:id])
	   end

    def index
 	@birds = Bird.all
   end

   private
  
   def birds_params
    params.require(:bird).permit(:name, :size, :colours, :description)
    
    end

end