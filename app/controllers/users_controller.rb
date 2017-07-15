class UsersController < ApplicationController
  before_action :set_stats, only: [:show, :following, :follower]

  def show
# recommendsだす
    @followedUsers = Relation.where(user_id: current_user.id)
    following_ids = []
    following_ids << current_user.id
    @followedUsers.each do |followed|
      following_ids << followed.following_id
    end
    @recommends = User.where.not(id:following_ids).limit(3)
  end

  def following
    followingIDs = []
    @allFollowings = Relation.where(user_id: @user.id)
    @allFollowings.each do |follows|
    followingIDs << follows.following_id
    end
    @nameBox = []
    @followingsFromUser = User.where(id:followingIDs)
    @followingsFromUser.each do |userName|
    @nameBox << userName
    end
  end

  def follower
    followingIDs = []
    @allFollowings = Relation.where(following_id: @user.id)
    @allFollowings.each do |follows|
    followingIDs << follows.user_id
    end
    @nameBox = []
    @followingsFromUser = User.where(id:followingIDs)
    @followingsFromUser.each do |userName|
    @nameBox << userName
    end
  end

private
  def set_stats
    @user = User.find(params[:id])
    # ツイートカウント
    @tweets = @user.tweets.order("created_at DESC")
    @myTweetCount = @tweets.count
    # フォローカウント
    @myFollowings = @user.relations
    @myFollowingsCount = @myFollowings.count
    if @myFollowingsCount == nil
      return 0
    end
    # フォロワーカウント
    allFollowers = Relation.where(following_id: @user.id)
    @myFollowersCount = allFollowers.count
    if @myFollowersCount == nil
      return 0
    end
  end
end
