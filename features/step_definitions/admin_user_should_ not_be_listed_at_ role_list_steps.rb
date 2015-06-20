When(/^visit role assignation page$/) do
 visit '/roles'
end

Then(/^his name should not be listed$/) do
  expect(page).not_to have_css('.roles-table td', :text => @admin.name)
end