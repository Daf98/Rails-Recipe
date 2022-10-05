require 'rails_helper'

describe 'Get /foods' do
  it 'will present foods page' do
    user = FactoryBot.create(:user)
    Food.create(name: 'Apple', measurement_unit: 'grams', quantity: 1, price: 5, user:)
    Food.create(name: 'Pineapple', measurement_unit: 'grams', quantity: 1, price: 1, user:)
    Food.create(name: 'Chicken breasts', measurement_unit: 'units', quantity: 1, price: 2, user:)
    sign_in user
    visit '/foods'
    expect(current_path).to eq(foods_path)
    expect(page).to have_content('Sign out')
    expect(page).to have_content('Edit profile')
    expect(page).to have_content('Foods')
    expect(page).to have_content('Recipes')
    expect(page).to have_content('Shopping list')
    expect(page).to have_content('Measurement unit')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Unit price')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Pineapple')
    expect(page).to have_content('Chicken breasts')
    expect(page).to have_content('grams')
    expect(page).to have_content('units')
    expect(page).to have_content('1')
    expect(page).to have_content('2')
    expect(page).to_not have_content('3')
    expect(page).to_not have_content('4')
    expect(page).to have_content('5')
  end
end

describe 'Get /general_shopping_list' do
  it 'will present foods page' do
    @user = FactoryBot.create(:user)
    sign_in @user
    visit '/general_shopping_list'
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('Food')
    expect(page).to have_content('Quantity')
    expect(page).to have_content('Price')
    expect(page).to have_content('Amount of food items to buy:')
    expect(page).to have_content('Total value of food needed:')
  end
end


feature 'User logs in and logs out' do
  scenario 'with correct details' do
    create(:user, email: 'recipe@test.com', password: 'password')

    visit '/foods'
    expect(current_path).to eq(foods_path)

    click_link 'Recipe app'
    expect(page).to have_content('Recipe app')
    expect(page).to have_content('Sign up')
    expect(page).to have_content('Sign in')
    expect(current_path).to eq(root_path)

    visit '/'

    click_link 'Sign in'
    expect(page).to have_content('Recipe app')
    expect(page).to have_content('Remember me')
    expect(current_path).to eq(new_user_session_path)

    # login 'recipe@test.com', 'password'

    # expect(page).to have_css('h1', text: 'Foods')
    # expect(current_path).to eq '/'
    # expect(page).to have_content 'Signed in successfully'
    # expect(page).to have_content 'Foods'

#     click_button 'Sign out'

#     expect(current_path).to eq '/'
#     expect(page).to have_content 'Signed out successfully'
#     expect(page).not_to have_content 'recipe@test.com'

#   end

#   scenario "unconfirmed user cannot login" do

#     create(:user, skip_confirmation: false, email: "e@example.tld", password: "test-password")

#     visit new_user_session_path

#     login "e@example.tld", "test-password"

#     expect(current_path).to eq(new_user_session_path)
#     expect(page).not_to have_content "Signed in successfully"
#     expect(page).to have_content "You have to confirm your email address before continuing"
#   end

#   scenario "locks account after 10 failed attempts" do

#     email = "someone@example.tld"
#     create(:user, email: email, password: "somepassword")

#     visit new_user_session_path

#     (1..8).each do |attempt_num|
#       login email, "wrong-password #{attempt_num}"
#       expect(page).to have_content "Invalid email or password"
#     end

#     login email, "wrong-password 9"
#     expect(page).to have_content "You have one more attempt before your account is locked"

#     login email, "wrong-password 10"
#     expect(page).to have_content "Your account is locked."

#   end
# end
# feature 'User registers' do

#   scenario 'with valid details' do

    visit '/'

    click_link 'Sign up'
    expect(current_path).to eq(new_user_registration_path)
    expect(page).to have_content('6 characters minimum')
    # fill_in 'email', with: 'recipe@test.com'
    # fill_in 'password', with: 'test-password'
    # fill_in 'password confirmation', with: 'test-password'
    # click_button 'Sign up'

    # expect(current_path).to eq '/'
    # expect(page).to have_content(
    #   'A message with a confirmation link has been sent to your email address.
    #   Please follow the link to activate your account.'
    # )

    # open_email 'tester@example.tld', with_subject: 'Confirmation instructions'
    # visit_in_email "Confirm my account"

    # expect(current_path).to eq new_user_session_path

#     click_link 'Sign in'
#     fill_in "email", with: "tester@example.tld"
#     fill_in "password", with: "test-password"
#     click_button "Log in"

#     expect(current_path).to eq "/"
#     expect(page).to have_content "Signed in successfully."
#     expect(page).to have_content "Hello, tester@example.tld"
#   end


#   context "with invalid details" do

#     before do
#       visit new_user_registration_path
#     end

#     scenario "blank fields" do

#       expect_fields_to_be_blank

#       click_button "Sign up"

#       expect(page).to have_error_messages "Email can't be blank",
#         "Password can't be blank"
#     end

#     scenario "incorrect password confirmation" do

#       fill_in "email", with: "tester@example.tld"
#       fill_in "password", with: "test-password"
#       fill_in "password confirmation", with: "not-test-password"
#       click_button "Sign up"

#       expect(page).to have_error_message "Password confirmation doesn't match Password"
#     end

#     scenario "already registered email" do

#       create(:user, email: "dave@example.tld")

#       fill_in "email", with: "dave@example.tld"
#       fill_in "password", with: "test-password"
#       fill_in "password confirmation", with: "test-password"
#       click_button "Sign up"

#       expect(page).to have_error_message "Email has already been taken"
#     end

#     scenario "invalid email" do

#       fill_in "email", with: "invalid-email-for-testing"
#       fill_in "password", with: "test-password"
#       fill_in "password confirmation", with: "test-password"
#       click_button "Sign up"

#       expect(page).to have_error_message "Email is invalid"
#     end

#     scenario "too short password" do
      
#       min_password_length = 8
#       too_short_password = "p" * (min_password_length - 1)
#       fill_in "email", with: "someone@example.tld"
#       fill_in "password", with: too_short_password
#       fill_in "password confirmation", with: too_short_password
#       click_button "Sign up"

#       expect(page).to have_error_message "Password is too short (minimum is 8 characters)"
    # end

  end

  private

  def expect_fields_to_be_blank
    expect(page).to have_field('email', with: '', type: 'email')
    # These password fields don't have value attributes in the generated HTML,
    # so with: syntax doesn't work.
    expect(find_field('password', type: 'password').value).to be_nil
    expect(find_field('password confirmation', type: 'password').value).to be_nil
  end

  def login(email, password)
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Log in'
  end
end
