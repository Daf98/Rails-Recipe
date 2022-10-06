require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.new(name: 'Daf', email: 'daf@gmail.com', password: '123456')
    @food = Food.new(name: 'Chocolate', measurement_unit: 'grams', quantity: 20, price: 1, user: @user)
    @recipe = Recipe.new(name: 'Cake', description: 'Dessert', cooking_time: 3, preparation_time: 2, public: true,
                         user: @user)
    @recipe_food = RecipeFood.new(quantity: 200, food: @food, recipe: @recipe)
  end
  it 'should be valid' do
    expect(@recipe_food).to be_valid
  end
  it 'should return the quantity' do
    expect(@recipe_food.quantity).to eq(200)
  end
  it 'should return the correct food id' do
    expect(@recipe_food.food_id).to eq(@food.id)
  end
  it 'should return the correct recipe id' do
    expect(@recipe_food.recipe_id).to eq(@recipe.id)
  end
end
