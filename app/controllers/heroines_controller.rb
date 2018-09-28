class HeroinesController < ApplicationController
  def index
      # byebug
   if params[:power_name]
      power = Power.find_by(name: params[:power_name])
      if power == nil
          # byebug
          @heroines = Heroine.all
      else
          @heroines = Heroine.where('power_id LIKE ?', "%#{power.id}%")
          # byebug
      end

   else
    @heroines = Heroine.all
   end

  end

  def show
      @heroine = Heroine.find(params[:id])
  end

  def new
      @heroine = Heroine.new
  end

  def create
      @heroine = Heroine.create(params.require(:heroine).permit(:name, :super_name, :power_id))
      if @heroine.save
          redirect_to @heroine
      else
          render "new"
      end
  end

end
