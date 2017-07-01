class UsersController < ApplicationController

  def show
    @myTweets = Tweet.find
  end

  # private 
  # end

end
