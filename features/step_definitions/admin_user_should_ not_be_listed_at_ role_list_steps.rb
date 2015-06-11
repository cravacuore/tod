When(/^visit role assignation page$/) do
 visit '/roles'
end

Then(/^his name should not be listed$/) do
  expect(page).to have_content(@admin.name, count: 1)
end