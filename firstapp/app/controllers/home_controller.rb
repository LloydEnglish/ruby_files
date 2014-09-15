class HomeController < ApplicationController

def index
  @animals = Animal.all
  @birds = Bird.all
end
