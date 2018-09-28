class HeroinesController < ApplicationController

  before_action(:find_heroine, {only: [:show, :edit, :update]})

  def index
    if !params[:commit].nil?
      @heroines = Heroine.find_by_power(params[:powers])
    else
      @heroines = Heroine.all
    end
    @powers = Power.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      redirect_to new_heroine_path
    end
  end

  def search
    @power = Power.find(params[:id])
  end

  def edit
    @powers = Power.all
  end

  def update
    if @heroine.update(heroine_params)
      redirect_to heroine_path(@heroine)
    else
      redirect_to edit_heroine_path
    end
  end

  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :img_url)
  end

end
