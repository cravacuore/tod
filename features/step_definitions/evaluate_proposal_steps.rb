Given(/^a proposal he did not evaluate yet$/) do
  @proposal = Proposal.create(
    :title       => "Proposal for evaluation",
    :description => "This is a proposal for evaluation description test",
    :author      => "Author",
    :email       => "some@email.com"
  )
  @proposal.save!
end

When(/^a revisor user visit proposal list$/) do
  visit '/proposal/list'
  expect(page).to have_content 'Proposal for evaluation'
end

And(/^selects a proposal$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
  expect(page).to have_content 'Deja un comentario:'
end

And(/^clicks on "(.*?)" button$/) do |btn_label|
  click_link btn_label
end

Then(/^should see evaluation form$/) do
  expect(page).to have_content 'Proposal for evaluation'
end

When(/^evaluates it with opinion "(.*?)"$/) do |opinion|
  select opinion, from: 'evaluation_opinion'
end

And(/^leaves a valid comment$/) do
  valid_comment = "This is a valid comment"
  fill_in('evaluation_body', :with => valid_comment)
end

Then(/^evaluation confirmation with opinion "(.*?)" is displayed$/) do |opinion|
  expect(page).to have_content opinion
end

When(/^comments it with comment "(.*?)"$/) do |comment|
  fill_in('evaluation_body', :with => comment)
end

Then(/^should see "(.*?)"$/) do |eval_msg|
  expect(page).to have_content eval_msg
end

When(/^evaluates proposal$/) do
  steps %{
      When clicks on "Evaluar" button
      Then should see evaluation form
      When evaluates it with opinion "Rechazo Fuerte"
      And leaves a valid comment
      When submitting
  }
end

When(/^selects the same proposal$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
end



