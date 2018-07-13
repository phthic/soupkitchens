class FoodPantriesController < ApplicationController
  def index
    @food_pantries = FoodPantry.all
  end

  def new
  end

  def edit
  end

  def show
  end

  def _form
  end
end
