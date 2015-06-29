Given(/^a proposal evaluated by that user$/) do
  @proposal = Proposal.create(
    :title       => "proposal for evaluation list view",
    :description => "proposal for evaluation list view description test",
    :author      => "a test author who likes evaluations",
    :email       => "test@domini.com"
  )
  @proposal.save!
  @evaluation = Evaluation.create(
    :proposal_id => @proposal.id.to_s,
    :evaluator   => 'Un nombre',
    :comment     => 'This is a valid comment',
    :opinion     => EvaluationOpinion.new
  )
  @evaluation.save!
end

Given(/^a proposal not evaluated by that user$/) do
  @second_proposal = Proposal.create(
    :title       => "Second proposal for evaluation list view",
    :description => "Second proposal for evaluation list view description test",
    :author      => "another test author who likes evaluations",
    :email       => "test@domini.com"
  )
  @second_proposal.save!
  @evaluation_2 = Evaluation.create(
    :proposal_id => @second_proposal.id.to_s,
    :evaluator   => 'Otro nombre',
    :comment     => 'This is a valid comment',
    :opinion     => EvaluationOpinion.new
  )
  @evaluation_2.save!
end

When(/^revisor user visits the details for a proposal he did evaluate$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
end

Then(/^he should see "(.*?)" button$/) do |btn_label|
  find_link btn_label
end

When(/^he clicks the evaluations button$/) do
  click_link('Ver Evaluaciones')
end

Then(/^he should see the proposal evaluations$/) do
  expect(page).to have_content('Evaluaciones:')
end

When(/^revisor user visits the details for a proposal he didn't evaluate$/) do
  visit '/proposal/detail?proposal_id=' + @second_proposal.id.to_s
end

