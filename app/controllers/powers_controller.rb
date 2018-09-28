class PowersController < ApplicationController

  before_action(:find_power, only: [:show, :edit, :update])

  def index
    @powers = Power.all
  end

  def show
    @power.description = @power.description.slice(0,1).capitalize + @power.description.slice(1..-1)
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)
    if @power.save
      redirect_to power_path(@power)
    else
      redirect_to new_power_path
    end
  end

  def edit

  end

  def update
    if @power.update(power_params)
      redirect_to power_path(@power)
    else
      redirect_to edit_power_path(@power)
    end
  end

  private

  def find_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end

end
