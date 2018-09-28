class HeroinesController < ApplicationController

  before_action :find_heroine, only: [:show, :edit, :update]

  def index
    @heroines = Heroine.all
  end

  def show

  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(name: params["heroine"][:name], super_name: params["heroine"][:super_name], power_id: params["heroine"][:power_id])
    render :show
  end

  def edit

  end

  def update

  end


private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  # def strong_params
  #   params.require(:heroine).permit(:id, :name, :super_name, :power_id)
  # end
end
