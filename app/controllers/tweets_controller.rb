class TweetsController < ApplicationController
  before_action :set_user, only: [:index, :crete, :caution, :checked, :search, :moment]
  before_action :user_stats, only: [:index, :crete, :caution, :checked, :search, :moment]
  before_action :checking_word, only: [:create]
  before_action :set_stats, only: [:index, :crete, :caution, :checked, :search, :moment]

  def search
    tweets = Tweet.where('content LIKE(?)', "%#{params[:keyword]}%")
    @numOfTweets = tweets.count
    @tweets = tweets.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

  def new
    @tweet = Tweet.new
  end

  def create
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
    @tweets = Tweet.includes(:user).where("user_id IN(?)", @following_ids).order("created_at DESC").page(params[:page]).per(6)
  end

  def moment
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(6)
  end

  private

  def set_user
    @user = current_user
    @tweet = current_user.id


    # indexとmomentの共通処理
    @followedUsers = Relation.where(user_id: current_user.id)
    @following_ids = []
    @following_ids << current_user.id
    @followedUsers.each do |followed|
      @following_ids << followed.following_id
    end
    @recommends = User.where.not(id:@following_ids).order("RAND()").limit(3)
  end

  def tweet_params
    params.require(:tweet).permit(:content, :image).merge(user_id: current_user.id)
  end

  def user_stats
     @numOfTweets = @user.tweets.count
     @numOfFollows = @followedUsers.count
     @numOfFollowers = @following_ids.count
  end

  def checking_word
    words = ["あほ", "アホ", "阿呆", "ぼけ", "ボケ", "かす", "カス", "しね", "朝鮮", "チョン", "デリヘル", "包茎", "童貞", "処女", "クソ", "うんこ", "ホモ", "バイセクシャル", "ゲイ", "レズビアン", "homo", "きもい", "キモい", "キモい", "変態", "馬鹿", "baka", "fuck", "ファック", "ケツ", "キチガイ", "基地外", "気違い", "気狂い" "ブタ", "bitch", "ビッチ", "死ね", "氏ね", "shine", "タヒね", "ﾀﾋ", "タヒ" "市ね", "乞食", "ロリババァ", "BBA", "くず", "屑", "レイプ", "醜", "ブス", "不細工", "ぶす", "殺す", "殺", "殺害", "ガイジ", "野郎", "メンヘラ", "ヤリマン", "性病", "ヲタ", "部落", "ニガー", "黒人", "土人", "外人", "田舎者", "ノータリン"]
    @tweet = Tweet.new(tweet_params)
    words.each do |word|
      if @tweet.content.include?(word) == true
        render :caution and return
      end
    end
  end

  def set_stats
    @user = current_user
    # ツイートカウント
    tweets = @user.tweets.order("created_at DESC")
    @tweets = tweets.page(params[:page]).per(6)
    @myTweetCount = tweets.count
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

