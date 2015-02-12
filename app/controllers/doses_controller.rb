class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]
  before_action :find_dose, only: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    #Customize => Ingredient.new....
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy

    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)




   # @dose = Dose.find(params[:id])
   # @cocktail = @dose.cocktail
   # @dose.destroy
   # redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end


  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

end
