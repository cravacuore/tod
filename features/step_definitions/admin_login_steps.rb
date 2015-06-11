# encoding: utf-8
Given(/^a user with mail "(.*?)"$/) do |mail|

  @mail = mail
  @user = User.new_user @mail
  @user.name = 'Albus'
  @user.save!
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(
      {
          :provider => 'github',
          :uid => @user.uid
      }
  )
  visit '/'
end

When(/^logging in$/) do
  click_link('Iniciar sesión con GitHub')
end

Then(/^he should not be logged as admin$/) do
  user = User.first(:email => @mail)
  expect(AdminManager.is_admin user).to eq false
end

Then(/^he should be logged as admin$/) do
  user = User.first(:email => @mail)
  expect(AdminManager.is_admin user).to eq true
end
