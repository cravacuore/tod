Given(/^added proposal with title "(.*?)" and "(.*?)" tags$/) do |title, tags|
  @proposal = Proposal.new
  @proposal.title = title
  @proposal.description = "A proposal description"
  @proposal.author = "An author"
  @proposal.email="test@dominio.com"
  @proposal.date = Time.now
  @proposal.tag_list = tags.downcase
  @proposal.save
end

When(/^I search with "(.*?)"$/) do |query|
  visit '/'
  fill_in('query', :with => query)
  click_button('Buscar')
end

Then(/^I should see no results$/) do
  expect(page).to have_content("No se han encontrado resultados")
end

Then(/^I should see (\d+) results$/) do |amount|
  page.should have_css("tbody#results tr",:count=> amount)
end

Then(/^result should be proposal with title "(.*?)"$/) do |title|
  expect(page).to have_content(title)
  expect(page).not_to have_content("No se han encontrado resultados")
end

