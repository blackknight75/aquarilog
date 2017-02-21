class BreedsController < ApplicationController

  def new
    @breed = Breed.new
  end

  def create
    @breed = Breed.new(breed_params)
      if @breed.save
        redirect_to @breed
      else
        render :new
      end
  end

  def show
    @breed = Breed.find(params[:id])
  end

  private

  def breed_params
    params.require(:breed).permit(:name, :temperament)
  end

end
