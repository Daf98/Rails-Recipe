require 'rails_helper'

RSpec.describe 'Page header', type: :feature do
  describe 'without FactoryBot login' do
    it 'will present navbar options' do
      visit root_path
      expect(page).to have_content('Recipe app')
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Sign in')
      expect(page).to_not have_content('Someone')
      expect(page).to_not have_content('Sign out')
      expect(page).to_not have_content('Edit profile')
      expect(page).to_not have_content('Foods')
      expect(page).to_not have_content('Recipes')
      expect(page).to_not have_content('Shopping list')
    end

    it 'will stay on root page when click on "Recipe app"' do
      visit root_path
      click_link 'Recipe app'
      expect(current_path).to eq(root_path)
    end

    it 'will go to new user registration when click on "Sign up"' do
      visit root_path
      click_link 'Sign up'
      expect(current_path).to eq(new_user_registration_path)
    end

    it 'will have new user registration content' do
      visit root_path
      click_link 'Sign up'
      expect(page).to have_content('(6 characters minimum)')
    end

    it 'will have new user registration button content' do
      visit root_path
      click_link 'Sign up'
      expect(page).to have_button('Sign up')
    end

    it 'will have new user registration with input fields' do
      visit root_path
      click_link 'Sign up'
      expect(page).to have_field('Name')
      expect(page).to have_field('email')
      expect(page).to have_field('new-password')
    end

    it 'will have new user registration with classes for bootstrap card' do
      visit root_path
      click_link 'Sign up'
      expect(page).to have_css('.card')
      expect(page).to have_css('.card-body')
    end

    it 'will go to new user session when click on "Sign in"' do
      visit root_path
      click_link 'Sign in'
      expect(current_path).to eq(new_user_session_path)
    end

    it 'will have new user session content' do
      visit root_path
      click_link 'Sign in'
      expect(page).to have_content('Remember me')
    end

    it 'will have new user session button content' do
      visit root_path
      click_link 'Sign in'
      expect(page).to have_button('Log in')
    end

    it 'will have new user session with input fields' do
      visit root_path
      click_link 'Sign in'
      expect(page).to have_field('email')
      expect(page).to have_field('current-password')
    end

    it 'will have new user session with classes for button "Log in"' do
      visit root_path
      click_link 'Sign in'
      expect(page).to have_css('.actions')
      expect(page).to have_css('.btn-secondary')
    end
  end

  describe 'with FactoryBot login' do
    before(:each) do
      @user = FactoryBot.create(:user)
    end

    it 'will present navbar options' do
      sign_in @user
      visit root_path
      expect(page).to_not have_content('Recipe app')
      expect(page).to_not have_content('Sign up')
      expect(page).to_not have_content('Sign in')
      expect(page).to have_content('Someone')
      expect(page).to have_content('Sign out')
      expect(page).to have_content('Edit profile')
      expect(page).to have_content('Foods')
      expect(page).to have_content('Recipes')
      expect(page).to have_content('Shopping list')
    end

    it 'will stay on root page when click on "Someone"' do
      sign_in @user
      visit root_path
      click_link 'Someone'
      expect(current_path).to eq(root_path)
    end

    it 'will logout when click on "Sign out"' do
      sign_in @user
      visit root_path
      click_button 'Sign out'
      expect(current_path).to eq(root_path)
      expect(page).to have_content('Recipe app')
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Sign in')
      expect(page).to_not have_content('Someone')
      expect(page).to_not have_content('Sign out')
      expect(page).to_not have_content('Edit profile')
    end

    it 'will have edit profile content' do
      sign_in @user
      visit root_path
      click_link 'Edit profile'
      expect(page).to have_content('6 characters minimum')
      expect(page).to have_content('Unhappy?')
    end

    it 'will have edit profile button content' do
      sign_in @user
      visit root_path
      click_link 'Edit profile'
      expect(page).to have_button('Update')
      expect(page).to have_button('Cancel my account')
    end

    it 'will have edit profile with input fields' do
      sign_in @user
      visit root_path
      click_link 'Edit profile'
      expect(page).to have_field('email')
      expect(page).to have_field("new-password (leave blank if you don't want to change it)")
      expect(page).to have_field('new-password')
      expect(page).to have_field('current-password (we need your current password to confirm your changes)')
    end

    it 'will have edit profile with classes for bootstrap form' do
      sign_in @user
      visit root_path
      click_link 'Edit profile'
      expect(page).to have_css('.form-group')
      expect(page).to have_css('.form-control')
    end
  end
end
