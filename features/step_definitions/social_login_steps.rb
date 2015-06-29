Given(/^a user with a valid (linkedin|github) user$/) do |provider|
  @mail = 'albus@harp.com'
  @user = User.new_user @mail
  @user.name = 'Albus Dumbledore'
  @user.save!
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[provider.to_sym] = OmniAuth::AuthHash.new(
      {
          :provider => provider,
          :uid => @user.uid
      }
  )
end

When(/^visits the login page$/) do
  visit '/auth/sign_in'
end

And(/^selects login with (linkedin|github)$/) do |provider|
  click_link "#{provider}-login"
end

Then(/^user should be logged in$/) do
  expect(page).to have_content(@user.name)
end