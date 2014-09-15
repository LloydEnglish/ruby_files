class AnimalsController < ApplicationController

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animals_params)
    @animal.save
    redirect_to @animal
  end

  def update
    @animal = Animal.find(animals_params)

    if @animal.update(animals_params)
      redirect_to @animal
    else
      render 'edit'
    end
  end

  def edit
    @animal = Animal.find(params[:id])
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
