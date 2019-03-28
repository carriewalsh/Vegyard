class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.save

    redirect_to plant_path(@plant)
  end

  def show
    @plant = Plant.find(params[:id])
  end

  private

  def plant_params
    params.require(:plant).permit(:name,:days,:distance,:sun)
  end
end
