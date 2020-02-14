require 'rails_helper'

feature 'the sign up process' do
  scenario 'has new user page' do
    visit new_user_registration_path
    expect(page).to have_content 'Sign up'
  end

  feature 'signing up an user' do
    before(:each) do
      visit new_user_registration_path
      fill_in 'Email', with: 'carlos.au.filho@gmail.com'
      fill_in 'Name', with: 'Carlos'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Sign up'
    end

    scenario 'redirect to feed page after sign up' do
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    scenario 'show user name on the page' do
      expect(page).to have_content 'Carlos'
    end
  end
end
