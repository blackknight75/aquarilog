class FishController < ApplicationController

  def new
    @tank = Tank.find(params[:tank_id])
    @fish = Fish.new
  end

  def create
    @fish = Fish.new(fish_params)
    if @fish.save
      redirect_to tank_path(params[:tank_id])
    else
      render :new
    end
  end

  private

  def fish_params
    params.require(:fish).permit(:name, :breed_id, :cost, :temperament, :purchase_store, :purchase_date).merge(tank_id: params[:tank_id])
  end
end
