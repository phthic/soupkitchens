class FoodPantriesController < ApplicationController
  # added now in order to create a link on home page; to be added later. Similar to Soupkitchens_controller.rb -- is there a way to dynamically create it? 
  def index
    @food_pantries = FoodPantry.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end


end
