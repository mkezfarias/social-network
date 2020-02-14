require 'rails_helper'

feature 'create a new user' do
  before(:each) do
    visit root_path
  end

  scenario 'new user from signup form' do
    click_on 'Sign up'
    expect(current_path).to eql('/users/sign_up')
    fill_in 'Email', with: 'carlos.au.filho@gmail.com'
    fill_in 'Name', with: 'Carlos'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('Welcome!')
  end

  scenario 'new user from facebook signup' do
    click_on 'Log in with Facebook'
    OmniAuth.config.add_mock(:facebook, uid: '12345')
    expect(page).to have_content('Successfully authenticated from Facebook account.')
  end
end

feature 'signout user' do
  before(:each) do
    visit root_path
    click_on 'Sign up'
    expect(current_path).to eql('/users/sign_up')
    fill_in 'Email', with: 'carlos.au.filho@gmail.com'
    fill_in 'Name', with: 'Carlos'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
  end

  scenario 'log out user' do
    click_on 'Log out'
    expect(current_path).to eql('/users/sign_in')
  end
end

feature 'user options' do
  before(:each) do
    visit root_path
    click_on 'Sign up'
    expect(current_path).to eql('/users/sign_up')
    fill_in 'Email', with: 'carlos.au.filho@gmail.com'
    fill_in 'Name', with: 'Carlos'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
  end

  scenario 'view user profile' do
    expect(current_path).to eql('/')
    click_on 'mi perfil'
    click_on 'ver'
    expect(current_path).to eql("/profile/#{User.find_by(email: 'carlos.au.filho@gmail.com').id}")
  end
end
