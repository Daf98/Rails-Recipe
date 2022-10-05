require 'rails_helper'

RSpec.describe Food, type: :model do
  user = User.new(name: 'Anyone', email: 'email@email.com', password: '123456')
  food = Food.new(name: 'Food name', measurement_unit: 'grams', quantity: 2, price: 5, user:)
  it 'is valid with valid attributes' do
    expect(food).to be_valid
  end
  it 'Food name must be "Food name"' do
    expect(food.name).to eq('Food name')
  end
  it 'Food measurement unit must be grams' do
    expect(food.measurement_unit).to eq('grams')
  end
  it 'Food quantity must be 2' do
    expect(food.quantity).to eq(2)
  end
  it 'Food price must be 5' do
    expect(food.price).to eq(5)
  end
  it 'Food user_id must be user.id' do
    expect(food.user_id).to eq(user.id)
  end
end
