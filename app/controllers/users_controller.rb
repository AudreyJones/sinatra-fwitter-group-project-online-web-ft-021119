class UsersController < ApplicationController

  get '/signup' do
    erb :"/signup"
  end

  post '/signup' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if user.save
      redirect to "/tweets/tweets"
    elsif user.email == ""
      binding.pry
    else
      redirect "/signup"
    end
  end

end
