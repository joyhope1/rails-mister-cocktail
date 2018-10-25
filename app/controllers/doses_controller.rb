class DosesController < ApplicationController
  def new
    @dose = Dose.new(params[:cocktail_id])
  end

  def create
    @dose = Dose.create!(dose_params)
      redirect_to new_dose_path(@cocktail)
  end

  def destroy
    @doses = Dose.find(params[:id])
    @dose.destroy
  end

private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
