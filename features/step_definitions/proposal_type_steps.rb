# encoding: utf-8
Given(/^an author user$/) do
  @user = User.new
  @user.name = 'normal'
  @user.uid = 2
  @user.email = 'common@user.red'
  @user.save!
  visit '/proposal/new'
end

When(/^an author creates a proposal$/) do
  fill_in 'proposal[title]', :with => "title"
  fill_in 'proposal[author]', :with => "author_nick"
  fill_in 'proposal[description]', :with => "description"
end

And(/^submits$/) do
  click_button('Enviar')
end

And(/^he selects "([^"]*)" as sessions type$/) do |tipo|
  select tipo, from:'proposal[type]'
end

Then(/^sessions type for proposal should be "([^"]*)"$/) do |tipo|
  expect(page).to have_content(tipo)
end
