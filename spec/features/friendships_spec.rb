require 'rails_helper'

feature 'request friendship' do
  before(:each) do
    create_user_and_log_in
    click_on '> Log out'
    create_second_user_and_log_in
  end

  scenario 'send a friend request' do
    visit users_path
    expect(page).to have_content('Add some people')
    click_on 'Add to friends'
    click_on '> friend requests'
    expect(page).to have_content('cancel request')
  end

  scenario 'cancel a friend request' do
    visit users_path
    click_on 'Add to friends'
    click_on '> friend requests'
    click_on 'cancel request'
    expect(page).to_not have_content('cancel request')
  end
end

feature 'accept friendship' do
  before(:each) do
    visit root_path
    create_user_and_log_in
    click_on '> Log out'
    create_second_user_and_log_in
    visit users_path
    click_on 'Add to friends'
    click_on '> Log out'
  end

  scenario 'accept requests when counter increses' do
    visit root_path
    fill_in 'Email', with: 'carlos.au.filho@gmail.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    expect(page).to have_content('> friend requests ( 1 )')
    click_on '> friend requests ( 1 )'
    expect(page).to have_content('accept request')
    click_on 'accept request'
    expect(page).to_not have_content('accept request')
  end
end
