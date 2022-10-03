class RecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:success] = 'The post was successfully destroyed.'
    redirect_to recipes_path
  end

  # def create
  #   @post = Post.new(strong_params)
  #   @post.author = current_user
  #   respond_to do |format|
  #     format.html do
  #       if @post.save
  #         flash[:success] = 'Post saved successfully'
  #         redirect_to users_url
  #       else
  #         flash.now[:error] = 'Error: Post could not be saved'
  #         render :new, locals: { post: @post }
  #       end
  #     end
  #   end
  # end

  # private

  # # Using a private method to encapsulate the permissible parameters
  # # is just a good pattern since you'll be able to reuse the same
  # # permit list between create and update. Also, you can specialize
  # # this method with per-user checking of permissible attributes.
  # def strong_params
  #   params.require(:post).permit(:title, :text, :author)
  # end
end
