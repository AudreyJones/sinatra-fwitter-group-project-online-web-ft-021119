class UsersController < ApplicationController
  # validates_presence_of :name, :email, :password

  get '/signup' do
    if Helpers.is_logged_in?(session) == true
      redirect to "/tweets/tweets"
    else
      erb :"/signup"
    end

  end

  post '/signup' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if (user.username != "") && (user.email != "") && (user.password != nil)
      user.save
      session[:user_id] = user.id
      redirect to "/tweets/tweets"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    if Helpers.is_logged_in?(session) == true
      redirect to "/tweets/tweets"
    else
      erb :login
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
    if Helpers.is_logged_in?(session)
      redirect to "tweets/tweets"
    else
      erb :login
    end
  end

  get '/logout' do
    # binding.pry
    if Helpers.is_logged_in?(session) == true
      session.clear
      redirect to "/login"
    else
      redirect to "/homepage"
    end
  end

end
