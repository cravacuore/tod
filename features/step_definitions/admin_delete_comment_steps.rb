# encoding: UTF-8
And(/^a proposal with "(.*?)" comment$/) do |comentario|
  @proposal = Proposal.new
  @proposal.title = title
  @proposal.description = 'A proposal description'
  @proposal.author = 'Admin'
  @proposal.email  = 'some@email.com'
  @proposal.save!

  @comment = Comment.new
  @comment.author = "Autho2"
  @comment.body = comentario
  @comment.proposal_id= @proposal.id
  @comment.date = Time.now
  @comment.save!
end

When(/^admin user visits the proposals list$/) do
  visit '/proposal/list'
end

And(/^enters the details of the proposal$/) do
  visit '/proposal/detail?proposal_id=' + @proposal.id.to_s
end

And(/^click on the delete button of comment "(.*?)"$/) do |comentario|
  find("#delete-#{@comment.id}").click
end

Then(/^it should display "(.*?)"$/) do |msj|
  page.should have_content(msj)
end

And(/^comment "(.*?)" should not appear$/) do |comment|
    comentario=Comment.first(:body => comment)
    expect(comentario.nil?).to eq true
end

When(/^regular user visits the proposals list$/) do
  visit '/'
  click_link('Cerrar sesión')
  @user       = User.new
  @user.name  = 'User'
  @user.email = 'user@mail.com'
  @user.role  = Role.new :user
  @user.uid  = 2
  @user.save!
  logger.debug "CREATED admin with UID=#{@user.uid}"
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                                                  :provider => 'github',
                                                                  :uid => @user.uid
                                                              })
  click_link('Iniciar sesión con GitHub')
end


