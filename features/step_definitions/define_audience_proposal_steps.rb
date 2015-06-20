# encoding: utf-8
When(/^an user creates a proposal$/) do
  visit '/proposal/new'
  fill_in 'proposal[title]', :with =>'title'
  fill_in 'proposal[description]', :with => 'A proposal description'
  fill_in 'proposal[author]', :with => 'user'
  fill_in 'proposal[mail]', :with => 'some@email.com'
end

And(/^selects "(.*?)" as audience’s type$/) do |audience|
  select audience, from:'proposal[audience]'
end

Then(/^audience’s type for proposal should be "(.*?)"$/) do |audience|
  page.should have_content(audience)
end