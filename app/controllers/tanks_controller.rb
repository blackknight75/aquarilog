class TanksController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @tank = @user.tanks.new
  end

  def create
    user = User.find(params[:user_id])
    tank = user.tanks.new(tank_params)
    if tank.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @tank = Tank.find(params[:id])
  end

  private

  def tank_params
    params.require(:tank).permit(:name, :dimensions, :gallons)
  end
end
