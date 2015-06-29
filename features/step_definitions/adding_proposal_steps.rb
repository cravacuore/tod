Given(/^proposal title "(.*?)"$/) do |title|
  @title = title
  fill_in 'proposal[title]', :with => @title
end

Given(/^a description "(.*?)"$/) do |description|
  @description = description
  fill_in 'proposal[description]', :with => @description
end

Given(/^author nick "(.*?)"$/) do |author_nick|
  @author_nick = author_nick
  fill_in 'proposal[author]', :with => @author_nick
end

When(/^submitting$/) do
  click_button('Enviar')
end

Then(/^proposal is added$/) do
  expect(Proposal.all[0].title).to eq @title
  expect(Proposal.all[0].description).to eq @description
  expect(Proposal.all[0].author).to eq @author_nick
  expect(Proposal.all[0].email).to eq @mail
end

Given(/^new proposal$/) do
  click_link('Nueva Propuesta')
end

Then(/^it should raise an error$/) do
  expect { Proposal.new(@title, @description, @author, @mail) }.to raise_error
end

Then(/^the second proposal should have title "(.*?)"$/) do |new_title|
  @proposal = Proposal.all[1]
  Proposal.all[1].title.should eq new_title
end

And(/^email "(.*?)"$/) do |mail|
  @mail=mail
  fill_in 'proposal[mail]', :with => @mail
end

When(/^retry with "(.*?)"$/) do |mail|
  @mail=mail
  fill_in 'proposal[mail]', :with => @mail
end

