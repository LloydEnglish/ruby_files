class AnimalsController < ApplicationController

  def create
  @animal = Animal.new(animals_params)
  @animal.save
  redirect_to @animal
  end

  def show
  @animal = Animal.find(params[:id])
	end

 def index
 @animals = Animal.all
  end

   private
  
   def animals_params
    params.require(:animal).permit(:name, :weight, :description)
    end

end