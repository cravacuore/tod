# encoding: UTF-8

Given(/^a revisor user$/) do
  visit '/'
  @revisor= User.new
  @revisor.name= 'Un nombre'
  @revisor.email= 'revisor@tod.com'
  @revisor.role= Role.new(:revisor)
  @revisor.save!
  logger.debug "CREATED revisor with UID=#{@revisor.uid}"
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
        :provider => 'github',
        :uid => @revisor.uid
  })
  click_link('Iniciar sesión con GitHub')
end

Given(/^there are (\d+) proposals with tag "([^"]*)" only$/) do |cant_prop,tag|
  (1..cant_prop).each { |i|
    proposal = Proposal.new
    proposal.title = "#{i}-a title"
    proposal.description = 'A proposal description'
    proposal.author = "#{i}An author"
    proposal.email= "#{i}test@dominio.com"
    proposal.tag_list = tag.downcase
    proposal.save
  }
end

Given(/^there are (\d+) proposals with tag "(.*?)" and "(.*?)"$/) do |cant_prop, tag1, tag2|
  tag_list= tag1+" "+tag2
  (0...cant_prop).each { |i|
    proposal = Proposal.new
    proposal.title = i.to_s+"-a title"
    proposal.description = "A proposal description"
    proposal.author = i.to_s+"An author"
    proposal.email= "#{i}test@dominio.com"
    proposal.tag_list = tag_list.downcase
    proposal.save
  }
end

When(/^a revisor user visits reports page$/) do
  visit '/report/page'
end

When(/^selects proposals by tag report$/) do
  find('#tab-report-tag').click
end

When(/^selects tag "(.*?)"$/) do|tag|
  visit '/report/page'
  fill_in('consulta', :with => tag)
  find('#button-tag').click
end

Then(/^(\d+) proposals with tag "(.*?)" are listed$/) do |cantidad, tag|
  actual_order = page.all('tbody#results-tag tr').size
  expect(actual_order).to eq cantidad
  expect(page).to have_content(tag)
end

When(/^no tag is selected$/) do
  find('#button-tag').click
end

Then(/^(\d+) proposals are listed$/) do |cantidad|
  actual_order = page.all('tbody#results-tag tr').size
  expect(actual_order).to eq cantidad
end



Transform /^(\d+)$/ do |number|
  number.to_i
end

