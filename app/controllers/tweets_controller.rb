class TweetsController < ApplicationController

  get '/tweets/new' do #Load the Create Tweet form
    erb :"/tweets/new"
  end

  post '/tweets' do #Processes the form submission
    tweet = Tweet.create(content: params[content])
      if tweet.save
        redirect to "/tweets"
      else
        puts "Your tweet entry was denied"
      end
    erb :"/tweets/tweets"
  end

end
