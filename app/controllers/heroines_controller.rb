class HeroinesController < ApplicationController
  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  def index
    @heroines = Heroine.search(params[:q])
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  private
    def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id, :q)
    end

end
