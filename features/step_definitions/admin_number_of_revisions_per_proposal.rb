When(/^an admin user visits admin page$/) do
  visit '/admin/conference'
end

Then(/^amount of evaluations required should display (\d+) as default$/) do |number|
  revisions_number_should_equal number
end

And(/^changes the amount of evaluations for a proposal to (\d+)$/) do |number|
  fill_in 'conference[reviews_per_proposal]', :with => number
  click_button 'Guardar Cambios'
end


Then(/^a success message is displayed with quantity (\d+)$/) do |number|
  expect(page).to have_css('.alert-success', text: 'Cambios guardados exitosamente')
  revisions_number_should_equal number
end

def revisions_number_should_equal(number)
  find_field('conference[reviews_per_proposal]').value.should eq "#{number}"
end
