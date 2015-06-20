# encoding: UTF-8
Given(/^an admin user$/) do
  visit '/'
  @admin       = User.new
  @admin.name  = 'Admin'
  @admin.email = 'admin@mail.com'
  @admin.role  = Role.new :admin
  @admin.uid  = 1
  @admin.save!
  logger.debug "CREATED admin with UID=#{@admin.uid}"
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        :provider => 'github',
        :uid => @admin.uid
  })
  expect(User.first(:email => 'admin@mail.com')).not_to eq nil
  click_link('Iniciar sesión con GitHub')
end

Given(/^a regular user$/) do
  @user = User.new
  @user.name = 'normal'
  @user.uid = 2
  @user.email = 'common@user.red'
  @user.save!
end

Given(/^a user with revisor permission$/) do
  @revisor = User.new
  @revisor.name = 'revisor'
  @revisor.role = Role.new :revisor
  @revisor.uid = 3
  @revisor.email = 'revisor@revisor.red'
  @revisor.save!
end

When(/^admin designates regular user as revisor$/) do
  click_link('Roles')
  check("revisor_#{@user.uid}")
end

When(/^admin removes revisor privileges from user$/) do
  click_link('Roles')
  find("#revisor_#{@revisor.uid}").click
end

Then(/^regular user should be revisor$/) do
  expect(find("#revisor_#{@user.uid}[checked]").value).to eq @user.uid
end

Then(/^revisor should now be a regular user$/) do
  expect(page).to have_no_selector("#revisor_#{@user.uid}[checked]")
end

Then(/^he should see a role designated notification$/) do
  expect(page).to have_css('.toast-message', text: 'El usuario es ahora revisor')
end

Then(/^he should see a role revoked notification$/) do
  expect(page).to have_css('.toast-message', text: 'El el revisor es ahora un usuario regular')
end
