require 'rails_helper'

feature 'create new comment' do
  before(:each) do
    create_user_and_log_in
    @content = Faker::Lorem.sentence
    fill_in 'Content', with: @content
    click_on 'submit'
  end

  scenario 'add comment' do
    @content2 = Faker::Lorem.sentence
    page.find('#comment_content').set(@content2)
    page.find('#new_comment').find('[value="submit"]').click
    expect(page).to have_content @content2
  end
end
