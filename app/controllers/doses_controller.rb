class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @ingredients = params[:dose][:ingredient]
    # puts  "#{@ingredients}"

    @ingredients.each do |ingredient|
      @dose = Dose.create!(
        ingredient_id: ingredient.to_i,
        cocktail: @cocktail
      )
    end
  end

  def destroy
    @dose = Dose.find(params[:restaurant_id])
    @dose.destroy
    redirect_to cocktails_path(@ingredient.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient, :description)
  end
end
