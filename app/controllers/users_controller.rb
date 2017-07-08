class UsersController < ApplicationController
  
  def show
    @myTweets = current_user.tweets.order("created_at DESC")
    @myTweetCount = @myTweets.count

# フォローカウント
    @myFollowings = current_user.relations
    @myFollowingsCount = @myFollowings.count
    if @myFollowingsCount == nil
      return 0
    end

# フォロワーカウント(ダメロジック)
    # allFollowers = Relation.all
    # myFollowers = allFollowers.where(following_id: current_user.id)
    # @myFollowersCount = myFollowers.count
    # if @myFollowersCount == nil
    #   return 0
    # end

# フォロワーカウント
    allFollowers = Relation.where(following_id: current_user.id)
    @myFollowersCount = allFollowers.count
    if @myFollowersCount == nil
      return 0
  end

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
