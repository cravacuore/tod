Given(/^a proposal evaluated by that user$/) do
  @proposal = Proposal.create(
    :title       => "proposal for evaluation list view",
    :description => "proposal for evaluation list view description test",
    :author      => "a test author who likes evaluations",
    :email      => "test@domini.com"
  )
  @proposal.save!
  expect(Proposal.all).not_to be_empty
  @evaluation = Evaluation.create(
    :proposal_id => @proposal.id.to_s,
    :evaluator   => 'Un nombre',
    :comment     => 'This is a valid comment',
    :opinion     => EvaluationOpinion.new
  )
  @evaluation.save!
  expect(Evaluation.all).not_to be_empty
  var = Evaluation.all[0]
end

Given(/^a proposal not evaluated by that user$/) do
  @second_proposal = Proposal.create(
    :title       => "Second proposal for evaluation list view",
    :description => "Second proposal for evaluation list view description test",
    :author      => "another test author who likes evaluations"
  )
  @second_proposal.save
  expect(Proposal.all).not_to be_empty
  @evaluation_2 = Evaluation.create(
    :proposal_id => @second_proposal.id.to_s,
    :evaluator   => 'Otro nombre',
    :comment     => 'This is a valid comment',
    :opinion     => EvaluationOpinion.new
  )
  @evaluation_2.save
end

When(/^revisor user visits the proposal list$/) do
  visit '/proposal/list'
end

When(/^enters to a evaluated proposal$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
end

Then(/^he should see evaluations button$/) do
  page.should have_content('Ver Evaluaciones')
end

When(/^he clicks the evaluations button$/) do
  click_button('Ver Evaluaciones')
end

Then(/^he should see the proposal evaluations$/) do
  page.should have_content('')
end

When(/^revisor user visits the detail for a proposal he didn't evaluate$/) do
  visit '/proposal/detail?proposal_id=' + @second_proposal.id.to_s
end

Then(/^he should see the proposal evaluation form$/) do
  page.should have_content('Evaluar')
end
