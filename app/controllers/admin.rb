Tod::App.controllers :admin do
  get :roles, :map => '/roles' do with_admin_role{
      @users = User.all(:role.not => 'admin')
      render 'admin/roles'
    }
  end

  get :conference, :map => '/admin/conference' do with_admin_role{
    @conference = Conference.first_or_create
    render 'admin/conference'
  }
  end

  post :conference, :map => '/admin/conference' do with_admin_role {
    reviews_per_proposal = params[:conference][:reviews_per_proposal]
    @conference = Conference.first_or_create
    @conference.reviews_per_proposal = reviews_per_proposal
    @conference.save

    @success_message = true
    render 'admin/conference'
  }
  end

  get :remove_role, :params => [ :uid ] do
    logger.debug "ACTION: REMOVE REVISOR ROLE FOR #{params[:uid]}"
    User.find_uid(params[:uid]).update(:role => Role.new(:user))
  end

  get :asign_role, :params => [ :uid ] do
    logger.debug "ACTION: ADD REVISOR ROLE FOR #{params[:uid]}"
    User.find_uid(params[:uid]).update(:role => Role.new(:revisor))
  end
end
