Tod::App.controllers :auth do
  get :github_callback, :map => '/auth/:provider/callback' do
    omniauth = request.env['omniauth.auth']

    user = User.find_uid(omniauth['uid'])
    user = User.new_from_omniauth(omniauth, params[:provider]) if user.nil?

    # save @user into your session to say he's authenticated
    session[:user] = user

    # validates session user mail and sets admin role
    set_as_admin_if_eligible

    redirect url('/')
  end

  get :github_callback_failed, :map => '/auth/failure' do
    flash[:error] = "Error logging with github.com #{params[:message]}"
    redirect url('/')
  end

  get :github do
    redirect url('/auth/github')
  end

  get :linkedin do
    redirect url('/auth/linkedin')
  end

  get :sign_in do
    render 'auth/sign_in'
  end


  get :log_out do
    session.clear
    redirect url('/')
  end
end