class UsersController < ApplicationController
  # validates_presence_of :name, :email, :password

  get '/signup' do
    # binding.pry
    # if user.logged_in? == true
    # end
    erb :"/signup"
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
    erb :login
  end

  post '/login' do
    # binding.pry
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
    # binding.pry
    if Helpers.is_logged_in?(session)
      erb :tweets
    else
      erb :login
    end

  end

end
