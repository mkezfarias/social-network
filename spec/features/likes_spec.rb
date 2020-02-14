require 'rails_helper'

feature 'create new comment' do
  before(:each) do
    create_user_and_log_in
    @content = Faker::Lorem.sentence
    fill_in 'Content', with: @content
    click_on 'submit'
  end

  scenario 'like a post' do
    click_on 'Upvote'
    expect(page).to have_content('1 upvote')
  end

  scenario 'create comment and like it' do
    click_on 'Upvote'
    @content2 = Faker::Lorem.sentence
    page.find('#comment_content').set(@content2)
    page.find('#new_comment').find('[value="submit"]').click
    click_on 'Upvote'
    expect(page).to have_content('1 like')
  end
end
