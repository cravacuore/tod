Given(/^a proposal list page without proposals$/) do
  Proposal.destroy!
  expect(Proposal.all).to eq []
end

When(/^I browse the proposal list$/) do
  visit '/proposal/list'
end

Then(/^I should see no proposals$/) do
  expect(page).to have_content("Aun no hay propuestas, puedes agregar una si deseas")
end

Given(/^someone add proposal "(.*?)"$/) do |proposal|
   Proposal.create(
    :title       => proposal,
    :description => "proposal description test",
    :author      => "a test author",
    :email       => "test@domain.com"
  ).save
end

Then(/^I should see proposal "(.*?)"$/) do |proposal|
  expect(page).to have_content(proposal)
  expect(page).to have_content('a test author')
  expect(page).not_to have_content("Aun no hay propuestas, puedes agregar una si deseas")
end

Then(/^proposal "(.*?)" has to be on top of "(.*?)"$/) do |proposal1, proposal2|
  expect(page.body).to match /#{proposal1}.*#{proposal2}/m
end

