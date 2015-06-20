Given(/^a proposal$/) do
  @proposal = Proposal.create(
    :title       => "proposal for comment",
    :description => "proposal for comment description test",
    :author      => "a test author who likes comments",
    :email      => "un@dominio.com"
  )
  @proposal.save
end

Given(/^details proposal page$/) do
  visit 'proposal/detail?proposal_id=' + @proposal.id.to_s
end

Given(/^comment body "(.*?)"$/) do |body|
  @body = body
end

Given(/^the author "(.*?)"$/) do |author_name|
  @author = author_name
end

When(/^submitted$/) do
  fill_in('comment[author]', :with => @author)
  fill_in('comment[body]', :with => @body)
  click_button('Enviar')
end

Then(/^the comment is added and listed on the proposal view$/) do
  expect(page).to have_content(@author)
  expect(page).to have_content(@body)
end

Then(/^I should see comment from "(.*?)" on top of comment from "(.*?)"$/) do |comment1, comment2|
  expect(page.body).to match /#{comment1}.*#{comment2}/m
end

