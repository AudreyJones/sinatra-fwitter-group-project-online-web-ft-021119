class UsersController < ApplicationController

  def logged_in?
    # binding.pry
    (session[:user_id] != "") ? true : false
      # binding.pry
  end

  get '/signup' do
    binding.pry
    if user.logged_in? == true
    end
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

end
