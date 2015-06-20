And(/^a proposal he did not evaluate yet$/) do
  visit '/proposal/new'
  page.should have_content('Nueva Propuesta')
  fill_in 'proposal[title]', :with => "Proposal for comment"
  fill_in 'proposal[description]', :with => "Proposal for evaluation description test"
  fill_in 'proposal[author]', :with => "a test author who likes evaluations"
  click_button('Enviar')
  page.should have_content('Propuesta enviada correctamente')
  @proposal = Proposal.all[0]
  expect(@proposal.evaluations).to be_empty
end

When(/^a revisor user visit proposal list$/) do
  visit '/proposal/list'
  page.should have_content('Lista de Propuestas')
end

And(/^selects a proposal$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
  page.should have_content('Proposal for evaluation')
end

When(/^evaluates it with opinion "(.*?)"$/) do |opinion|
  select opinion, from: 'evaluation_opinion'
end

When(/^leaves a valid comment$/) do
  @valid_comment = "This is a valid comment"
  fill_in 'evaluation[evaluation_body]', :with => @valid_comment
  click_button('Evaluar')
end

Then(/^evaluation confirmation with opinion "(.*?)" should be displayed$/) do |opinion|
  page.should have_content 'Propuesta evaluada correctamente: ' + opinion
end

When(/^comments "(.*?)"$/) do |comment|
  fill_in 'evaluation[evaluation_body]', :with => comment
  click_button('Evaluar')
end

When(/^evaluates proposal$/) do
  select 'Rechazo Fuerte', from: 'evaluation_opinion'
  fill_in 'evaluation[evaluation_body]', :with => @valid_comment
  click_button('Evaluar')
end

When(/^visits the proposal detail$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
end

Then(/^should not be able to evaluate the proposal$/) do
  page.should_not have_content 'seleccione un dictamen'
  page.should_not have_content 'Evaluar'
end

Then(/^it should display "(.*?)"$/) do |msg|
  page.should have_content msg
end
