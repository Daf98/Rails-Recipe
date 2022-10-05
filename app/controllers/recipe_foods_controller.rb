class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe_food = RecipeFood.new
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.where(recipe_id: @recipe.id)
    @recipe_food.delete
    flash[:success] = 'The recipe food was successfully deleted.'
    redirect_to recipe_path
  end
end
