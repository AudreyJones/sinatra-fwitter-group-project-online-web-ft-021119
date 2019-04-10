class UsersController < ApplicationController

  get '/signup' do
    erb :"/signup"
  end

  post '/signup' do
    # binding.pry
    user = User.new(params)
    if user.save
      redirect to "/tweets/tweets"
    else
      redirect "/signup"
    end
  end

end
