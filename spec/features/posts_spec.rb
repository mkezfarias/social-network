require 'rails_helper'

feature 'create new post' do
  before(:each) do
    visit new_user_registration_path
    fill_in 'Email', with: 'carlos.au.filho@gmail.com'
    fill_in 'Name', with: 'Carlos'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
  end
  scenario 'add content and hit submit' do
    @content = Faker::Lorem.sentence
    fill_in 'Content', with: @content
    click_on 'submit'
    expect(page).to have_content @content
  end
end
