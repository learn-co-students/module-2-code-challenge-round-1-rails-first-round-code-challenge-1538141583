class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    @heroines_with_power = Heroine.search(Power.find_by(name:params[:search])).order("created_at DESC")

  end


def show
@heroine = Heroine.find(params[:id])
end

def new
@heroine = Heroine.new
end

def create
   @heroine = Heroine.create(name:params[:heroine][:name], super_name: params[:heroine][:super_name], power_id: params[:heroine][:power_id])
if @heroine.valid?
redirect_to @heroine
else
  render :new

end
end

def coupon_params
  params.require(:coupon).permit(:store, :coupon_code)
end

end
