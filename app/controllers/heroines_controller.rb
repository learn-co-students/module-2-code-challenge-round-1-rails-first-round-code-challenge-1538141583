class HeroinesController < ApplicationController
  def index
    if params[:search_power] == nil
      @heroines = Heroine.all
    else
      @heroines = Heroine.search_by_power(params[:search_power])
    end
  end



  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new
    @heroine.name = heroine_params[:name]
    @heroine.super_name = heroine_params[:super_name]
    @heroine.power_id = heroine_params[:power_id]
    @heroine.save
    redirect_to heroines_path
  end

  private

  def heroine_params
    byebug
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
