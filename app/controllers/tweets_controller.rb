class TweetsController < ApplicationController

  get '/tweets/new' do
    erb :new_tweet
  end

end
