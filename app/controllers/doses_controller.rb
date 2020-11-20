class DosesController < ApplicationController
before_action :set_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  # def show
  #   @dose = Dose.find()
  # end

  def create
    # puts  "#{@ingredients}"
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
      @dose.save!
      redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:restaurant_id])
    @dose.destroy
    redirect_to cocktails_path(@ingredient.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
