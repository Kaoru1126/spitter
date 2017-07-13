class TweetsController < ApplicationController
  before_action :set_user, only: [:index, :crete, :caution, :checked]
  before_action :checking_word, only: [:create]

  def new
    @tweet = Tweet.new
  end

  def create
    binding.pry
    @tweet = Tweet.new(tweet_params)
      if @tweet.save
      flash[:notice] = 'ツイートしました'
      redirect_to root_path
      else
      flash[:alert] = "ツイートに失敗しました"
      render :new
    end
  end

  def caution
    @tweet = Tweet.new
  end

  def checked
    binding.pry
    @tweet = Tweet.new(tweet_params)
     if @tweet.save
      flash[:notice] = 'ツイートしました'
      redirect_to root_path
    else
      flash[:alert] = "ツイートに失敗しました"
      render :new
    end
  end

  def index
    @user = current_user
    @followedUsers = Relation.where(user_id: current_user.id)
    following_ids = []
    following_ids << current_user.id
    @followedUsers.each do |followed|
      following_ids << followed.following_id
    end
    @recommends = User.where.not(id:following_ids).limit(3)
  end

  def moment
    @user = current_user
    @tweets = Tweet.order("created_at DESC")
    @followedUsers = Relation.where(user_id: current_user.id)
    following_ids = []
    following_ids << current_user.id
    @followedUsers.each do |followed|
      following_ids << followed.following_id
    end
    @recommends = User.where.not(id:following_ids).limit(3)
  end

  private

  def set_user
    @tweet = current_user.id
  end

  def tweet_params
    params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id)
  end

  def checking_word
    @tweet = Tweet.new(tweet_params)
     if @tweet.content.include?("しね")
     render :caution
    end
  end
end


# def create
  #   @tweet = Tweet.new(tweet_params)
  #   checkedContent = ["#{@tweet.content}"]
  #    if checkedContent.include?("しね")
  #     return checkedContent
  #     redirect_to caution_tweets_path
  #   elsif @tweet.save
  #     flash[:notice] = 'ツイートしました'
  #     redirect_to root_path
  #   else
  #     flash[:alert] = "ツイートに失敗しました"
  #     render :new
  #   end
  # end


  # def caution(create)
  #   @tweet = Tweet.new(tweet_params)
  #   if @tweet.save
  #     flash[:notice] = 'ツイートしました'
  #     redirect_to root_path
  #   else
  #     flash[:alert] = "ツイートに失敗しました"
  #     render :new
  #   end
  # end

  #  def create
  #   @tweet = Tweet.new(tweet_params)
  #   checkedContent = ["#{@tweet.content}"]
  #    if checkedContent.include?("しね")
  #     @tweet = Tweet.new(tweet_params)
  #     render :caution
  #   elsif @tweet.save
  #     flash[:notice] = 'ツイートしました'
  #     redirect_to root_path
  #   else
  #     flash[:alert] = "ツイートに失敗しました"
  #     render :new
  #   end
  # end
