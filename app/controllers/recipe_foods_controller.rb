class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  def new
    @recipe_food = RecipeFood.new
  end

  # def create
  #   @recipe_food = Recipe.new(strong_params)
  #   respond_to do |format|
  #     format.html do
  #       if @recipe.save
  #         flash[:success] = 'Recipe saved successfully'
  #         redirect_to recipes_url
  #       else
  #         flash.now[:error] = 'Error: Recipe could not be saved'
  #         render :new, locals: { recipe: @recipe }
  #       end
  #     end
  #   end
  # end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.find_by(recipe_id: @recipe.id)
    @recipe_food.destroy
    flash[:success] = 'The recipe food was successfully deleted.'
    redirect_to recipe_path
  end
end
