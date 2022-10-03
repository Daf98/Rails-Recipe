class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    flash[:success] = 'The recipe was successfully deleted.'
    redirect_to recipes_path
  end
end
