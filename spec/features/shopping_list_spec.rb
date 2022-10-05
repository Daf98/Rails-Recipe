require 'rails_helper'

RSpec.describe 'Shopping list page', type: :feature do
  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
      Food.create(name: 'Apple', measurement_unit: 'grams', quantity: 1, price: 5, user: @user)
      Food.create(name: 'Pineapple', measurement_unit: 'grams', quantity: 1, price: 1, user: @user)
      Food.create(name: 'Chicken breasts', measurement_unit: 'units', quantity: 1, price: 2, user: @user)
    end
    it 'will present foods page' do
      sign_in @user
      visit '/general_shopping_list'
      expect(current_path).to eq(general_shopping_list_path)
    end
    # it 'will present foods page' do
    #   sign_in @user
    #   visit foods_path
    #   expect(page).to have_content('Food')
    #   expect(page).to have_content('Measurement unit')
    #   expect(page).to have_content('Quantity')
    #   expect(page).to have_content('Unit price')
    #   expect(page).to have_content('Apple')
    #   expect(page).to have_content('Pineapple')
    #   expect(page).to have_content('Chicken breasts')
    #   expect(page).to have_content('grams')
    #   expect(page).to have_content('units')
    #   expect(page).to have_content('1')
    #   expect(page).to have_content('2')
    #   expect(page).to_not have_content('3')
    #   expect(page).to_not have_content('4')
    #   expect(page).to have_content('5')
    #   expect(page).to have_link('Add food'), href: new_food_path
    #   expect(page).to have_button('Delete')
    #   expect(page).to have_css('.btn-danger')
    #   expect(page).to have_css('.btn-sm')
    # end
  end
end
