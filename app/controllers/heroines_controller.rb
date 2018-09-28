class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)

    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end


  def show
    @heroine = Heroine.find(params[:id])
  end

  def search
    @heroines = []
    Heroine.all.each do |heroine|
      if params[:q] == "all"
        @heroines = Heroine.all
      elsif heroine.power.name == params[:q]
        @heroines << heroine
      end
    end
    @heroines
    render :index
  end


  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
