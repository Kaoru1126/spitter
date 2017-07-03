class UsersController < ApplicationController

  def show
    # binding.pry
    @myTweets = current_user.tweets.order("created_at DESC")
    @myTweetCount = @myTweets.count
  end

  # private
  # end

end
