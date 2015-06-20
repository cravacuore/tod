# encoding: UTF-8

Given(/^there are (\d+) proposals$/) do |cant_prop|
  for i in 1..cant_prop.to_i
    proposal = Proposal.new
    proposal.title = i.to_s+"-a title"
    proposal.description = "-A proposal description"
    proposal.author = i.to_s+"-An author"
    proposal.email= "#{i}test@dominio.com"
    proposal.tag_list = i.to_s+"-Tag"
    proposal.save
    end
end

When(/^a revisor user visits reports url$/) do
  visit '/report/page'
end

Then(/^reports page is displayed$/) do
  expect(page).to have_content("Reportes")
end

And(/^selects quantity report$/) do
  visit '/report/page'
  find('#tab-report-quantity').click
end

Then(/^quantity report is displayed with quantity (\d+)$/) do |cantidad|
  expect(page).to have_content(cantidad)
end

When(/^a non\-revisor user visits reports page$/) do
  click_link('Cerrar sesión')
  visit '/report/page'
end

Then(/^a not\-found page is displayed$/) do
  expect(page).to have_content("Acceso Restringido")
end