class BirdsController < ApplicationController


  def create
  @bird = Bird.new(birds_params)
  @bird.save
  redirect_to @bird
  end

  def show
  @bird = Bird.find(params[:id])
  if Bird.find(params[:id+1])
  @nextbird = @bird.id + 1
	end


  def index
 	@birds = Bird.all
  end

 private
    def birds_params
    params.require(:bird).permit(:name, :size, :colours, :description)
    end

end
end