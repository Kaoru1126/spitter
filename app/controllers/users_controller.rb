class UsersController < ApplicationController
  
  def show
    @myTweets = current_user.tweets.order("created_at DESC")
    @myTweetCount = @myTweets.count

# recommendsだす
    @followedUsers = Relation.where(user_id: current_user.id)
    following_ids = []
    following_ids << current_user.id
    @followedUsers.each do |followed|
      following_ids << followed.following_id
    end
    @recommends = User.where.not(id:following_ids).limit(3)
  end

end
