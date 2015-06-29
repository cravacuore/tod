Given(/^a proposal with "(.*?)" visits$/) do |visits_num|
  @proposal = Proposal.create(
    :title       => "Proposal for visits",
    :description => "This is a proposal for visits description test",
    :author      => "Author",
    :email       => "some@email.com",
    :visits      => visits_num
  )
  @proposal.save!
end

When(/^user visits proposal list$/) do
  visit '/proposal/list'
  expect(page).to have_content 'Lista de Propuestas'
end

Then(/^should see proposal listed with "(.*?)" visits$/) do |visits_num|
  table_row = find('tr', text: @proposal.title)
  expect(table_row).to have_content visits_num
end

Then(/^should see proposal with "(.*?)" visits$/) do |visits_num|
  visits_value = find('#visits')
  expect(visits_value).to have_content visits_num.to_s
end

When(/^user enters proposal details$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
end
