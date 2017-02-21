class FishController < ApplicationController

  def new
    @tank = Tank.find(params[:tank_id])
    @fish = @tank.fish.new
  end

  def create
    @fish = Fish.new(fish_params)
    if @fish.save
      redirect_to tank_path(params[:tank_id])
    else
      render :new
    end
  end

  def edit
    @tank = Tank.find(params[:tank_id])
    @fish = @tank.fish.find(params[:id])
  end

  def update
    @tank = Tank.find(params[:tank_id])
    @fish = @tank.fish.find(params[:id])
    if @fish.update(fish_params)
      redirect_to tank_fish_path(@tank, @fish)
    else
      render :new
    end
  end

  def show
    @tank = Tank.find(params[:tank_id])
    @fish = @tank.fish.find(params[:id])
  end

  private

  def fish_params
    params.require(:fish).permit(:name,
                                 :breed_id,
                                 :cost,
                                 :temperament,
                                 :purchase_store,
                                 :purchase_date,
                                 :fish_image
                                )
                                .merge(tank_id: params[:tank_id])
  end
end
