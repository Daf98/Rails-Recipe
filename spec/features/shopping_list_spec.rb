require 'rails_helper'

RSpec.describe 'Shopping list page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      apple = Food.create(name: 'Apple', measurement_unit: 'grams', quantity: 1, price: 5, user: @user)
      pineapple = Food.create(name: 'Pineapple', measurement_unit: 'grams', quantity: 1, price: 1, user: @user)
      chicken = Food.create(name: 'Chicken breasts', measurement_unit: 'units', quantity: 1, price: 2, user: @user)
      recipe = Recipe.create(name: 'Chicken apple pie', description: 'Grandma recipe', preparation_time: 2,
                             cooking_time: 1, public: true, user: @user)
      RecipeFood.create(food: apple, quantity: 20, recipe:)
      RecipeFood.create(food: pineapple, quantity: 10, recipe:)
      RecipeFood.create(food: chicken, quantity: 2, recipe:)
    end
    it 'will present general shopping list page' do
      sign_in @user
      visit '/general_shopping_list'
      expect(current_path).to eq(general_shopping_list_path)
    end
    it 'will present general shopping list page table header content' do
      sign_in @user
      visit general_shopping_list_path
      expect(page).to have_content('Food')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Price')
    end
    it 'will present general shopping list page table footer content' do
      sign_in @user
      visit general_shopping_list_path
      expect(page).to have_content('Amount of food items to buy: 29')
      expect(page).to have_content('Total value of food needed: $106')
    end
    it 'will present general shopping list page table content' do
      sign_in @user
      visit general_shopping_list_path
      expect(page).to have_content('Apple')
      expect(page).to have_content('Pineapple')
      expect(page).to have_content('Chicken breasts')
      expect(page).to have_content('9 grams')
      expect(page).to have_content('19 grams')
      expect(page).to have_content('1 units')
      expect(page).to have_content('$9')
      expect(page).to have_content('$95')
      expect(page).to have_content('$2')
    end
    it 'will present page css content' do
      sign_in @user
      visit general_shopping_list_path
      expect(page).to have_css('.table-striped')
      expect(page).to have_css('.navbar-expand-lg')
      expect(page).to have_css('.card-body')
    end
  end
end
